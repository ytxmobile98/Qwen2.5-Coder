CURDIR=$(dirname "$(realpath "$0")")
ROOT_DIR="$CURDIR"

MODEL_NAME="qwen2.5-coder-C"
MODEL_DIR="/data/models/Qwen2.5-Coder-7B-Instruct"
INPUT_PATH="$CURDIR/test_set/exec_repo_bench.jsonl"
OUTPUT_PATH="$CURDIR/results/$MODEL_NAME/generation.jsonl"

WORKERS=64
TP=1
EXTRA_ARGS="-max_context_tokens 8192 -max_tokens 32768 -max_generation_tokens 1024"

mkdir -p "$(dirname "$OUTPUT_PATH")"
bash "${ROOT_DIR}/eval.sh" "${MODEL_NAME}" "${MODEL_DIR}" "${INPUT_PATH}" "${OUTPUT_PATH}" ${WORKERS} ${TP} "${EXTRA_ARGS}"
