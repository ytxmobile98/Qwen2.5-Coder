#!/usr/bin/env bash

export CUDA_VISIBLE_DEVICES=2,3

MODEL_PATH=/data/models/Qwen2.5-Coder-7B
OUTPUT_DIR=/data/yangtx/outputs
OUTPUT_DIR="$OUTPUT_DIR"/qwen2.5-coder/7b-base/7b-base

bash evaluate_newline_args.sh \
  "$MODEL_PATH" \
  "$OUTPUT_DIR" \
  1
