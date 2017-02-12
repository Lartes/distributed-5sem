#!/usr/bin/env bash
for num in 03 04 05 06 07 08 09 10
do
add="bds"${num}".vdi.mipt.ru"
str=$(ssh "sparktest@"$add 'echo `cd /dfs/dn/; find -name '${1}'`; exit')
if [[ $str != "" ]]
then
echo ${add}':/dfs/dn'${str:1}
break
fi
done

