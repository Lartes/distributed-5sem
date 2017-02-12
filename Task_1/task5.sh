#!/usr/bin/env bash
dd if=/dev/zero of=hdfstest.dat  bs=$1  count=1
hadoop fs -put ./hdfstest.dat /tmp

#str=`hdfs fsck /tmp/hdfstest.dat -files -blocks`
str=`grep 'Total\ blocks' <(hdfs fsck /tmp/hdfstest.dat -files -blocks)`
numBlk=`expr "$str" : ".*validated...\([0-9]*\)"`
i=0
size=0
until [[ $i -eq $numBlk ]]
do
  str=`grep ${i}'\. ' <(hdfs fsck /tmp/hdfstest.dat -files -blocks)`
  blkId=`expr "$str" : ".*\(blk_[0-9]*\)"`
  i=$(($i+1))
  
  for num in 03 04 05 06 07 08 09 10
  do
  add="bds"${num}".vdi.mipt.ru"
  str=$(ssh "sparktest@"$add 'echo `cd /dfs/dn/; find -name '${blkId}'`; exit')
  if [[ $str != "" ]]
  then
    path='.'${str:1}
    sizea=$(ssh "sparktest@"$add 'echo `cd /dfs/dn/; stat -c%s '${path}'`; exit')
    size=$(($size+$sizea))
    break
  fi
  done
done
echo $(($1-$size))

str=`curl -i -X DELETE "http://bds11.vdi.mipt.ru:50070/webhdfs/v1/tmp/hdfstest.dat?op=DELETE"`
