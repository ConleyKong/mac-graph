#!/bin/sh

COMMIT=$(git --no-pager log --pretty=format:'%h' -n 1)

python -m macgraph.train \
	--model-dir output/model/sa_sp/exp/$COMMIT \
	--input-dir input_data/processed/sa_sp_small_100k \
	--disable-dynamic-decode \
	--disable-question-state \
	--input-layers 1 \
	--input-width 64 \
	--learning-rate 0.001 \
	--max-decode-iterations 4 \
	--max-gradient-norm 0.4 \
	--output-activation tanh \
	--output-classes 110 \
	--output-layers 1 \
	--read-activation tanh_abs \
	--read-dropout 0.2 \
	--read-from-question \
	--read-indicator-rows 1 \
	--read-layers 1 \
	--disable-read-extract \
	--vocab-size 110 \