from code_eval.base import Task
from datasets import load_dataset

SPECIAL_SEPERATOR = "\t----- SQL-EVAL -----\t"


class SqlTaskChatBase(Task):

    def __init__(self):
        super().__init__(
            stop_words=[
                # "\n\n",
                ";",
                "<pad>",
                "<|endoftext|>",
                "</s>",
                "<|im_end|>",
            ],
            requires_execution=False,
        )
        self.datasets = self.dataset["train"].to_list()
        print(f"{len(self.datasets) = }")

    def get_dataset(self):
        return self.datasets

    def get_prompt(self, doc):
        return doc["instruction"] + "\nPlease output only the final SQL query, starts with keyword `SELECT`."

    def get_reference(self, doc):
        return doc["output"]

    @staticmethod
    def _stop_at_stop_token(decoded_string, stop_tokens):
        min_stop_index = len(decoded_string)
        for stop_token in stop_tokens:
            stop_index = decoded_string.find(stop_token)
            if stop_index != -1 and stop_index < min_stop_index:
                min_stop_index = stop_index
        return decoded_string[:min_stop_index]

    def postprocess_generation(self, generation, idx):
        doc = self.datasets[idx]
        # input_len = doc.get("input_str_len", None)  # just use main-process
        # if input_len is None:
        #     return ""

        # generation = generation[input_len:]
        generation = self._stop_at_stop_token(generation, self.stop_words)
        generation = generation.replace("\n", " ")
        generation = generation.replace(";", "")
        generation = generation.replace("</s>", "")
        generation = generation.replace("```sql ", "")
        generation = generation.strip().replace("```", "")
        # cut from  the first SELECT
        generation = generation[generation.find("SELECT") :]

        db_id = doc["db_id"]
        generation = f"{generation}{SPECIAL_SEPERATOR}{db_id}"
        return generation

    def process_results(self, generations, references):
        pass
