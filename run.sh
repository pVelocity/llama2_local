#!/usr/bin/env zsh

exec > log 2>&1

python llama.py  --model_name="TheBloke/Llama-2-13B-Chat-GGML" --file_name="llama-2-13b-chat.ggmlv3.q5_K_M.bin"
