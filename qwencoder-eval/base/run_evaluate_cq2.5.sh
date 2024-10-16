#!/usr/bin/env bash

MODEL_PATH=/data/models/DeepSeek-Coder-V2-Lite-Instruct

OUTPUT_DIR=/data/yangtx/outputs
OUTPUT_DIR="$OUTPUT_DIR"/qwen2.5-coder/DeepSeek-Coder-V2-Lite-Instruct

bash evaluate_newline_args.sh \
  "$MODEL_PATH" \
  "$OUTPUT_DIR" \
  1
