#!/usr/bin/env bash

MODEL_7B_PATH=/data/models/Qwen2.5-Coder-7B-Instruct
OUTPUT_DIR=/data/yangtx/outputs

# bash evaluate_newline_args.sh \
#   ./qwen2.5-coder-1.5b \
#   outptus/qwen2.5-coder/1.5b-base \
#   1

bash evaluate_newline_args.sh \
  "$MODEL_7B_PATH" \
  "$OUTPUT_DIR/qwen2.5-coder/7b-base" \
  1