#!/usr/bin/env bash
str=`hdfs fsck \$1 -files -blocks`
expr "$str" : ".*\([0-9]*[0-9]\)\ block(s)"

