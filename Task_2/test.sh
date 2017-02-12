#!/usr/bin/env bash

OUT_DIR=$2
NUM_REDUCERS=$1

hadoop fs -rm -r -skipTrash $OUT_DIR*

# Wordcount
( hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -D mapred.jab.name="Straming wordCount" \
    -D mapreduce.job.reduces=$NUM_REDUCERS \
    -files count_mapper.py,sum_reducer.py \
    -mapper count_mapper.py \
    -reducer sum_reducer.py \
    -input /data/griboedov/ \
    -output ${OUT_DIR}) || echo "Error happens"

#Cheking result
for num in `seq 0 $[$NUM_REDUCERS - 1]`
do
    hadoop fs -cat ${OUT_DIR}/part-0000$num
done

