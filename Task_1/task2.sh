#!/usr/bin/env bash
str=$(tail -n 1 <(curl -i -L 'http://bds11.vdi.mipt.ru:50070/webhdfs/v1'$1'?op=OPEN&length=10'))
echo $str
