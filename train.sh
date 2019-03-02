#!/usr/bin/env bash
export MXNET_CPU_WORKER_NTHREADS=24
export MXNET_CUDNN_AUTOTUNE_DEFAULT=1
export MXNET_ENGINE_TYPE=ThreadedEnginePerDevice

NETWORK='sdu'
MODELDIR='./model3'
mkdir -p "$MODELDIR"
PREFIX="$MODELDIR/$NETWORK"
PRETRAINED="./model2/sdu,35"
LOGFILE="$MODELDIR/log_$NETWORK"

CUDA_VISIBLE_DEVICES='0' python -u train.py --network $NETWORK --prefix "$PREFIX" --pretrained $PRETRAINED > "$LOGFILE" 2>&1 &
