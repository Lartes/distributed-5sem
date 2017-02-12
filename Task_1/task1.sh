#!/usr/bin/env bash
str=`grep '0\. ' <(hdfs fsck \$1 -files -blocks)`
blkId=`expr "$str" : ".*\(blk_[0-9]*\)"`
str2=`hdfs fsck \$1 -files -blocks -blockId $blkId`
expr "$str2" : ".*rack:\ \([a-zA-z0-9.]*\)"

