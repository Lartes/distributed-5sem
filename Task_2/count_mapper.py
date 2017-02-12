#! /usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import string

reload(sys)
sys.setdefaultencoding('utf-8')

i = 0
hero_prev=" "
for line in sys.stdin:
    line = line.strip().translate(string.maketrans("",""), string.punctuation)
    line = line.split()
    hero=line[:1]
    line=line[1:]
    if hero <> hero_prev:
        i = i + 1
    hero_prev = hero
    print("{}_{}\t{}".format(hero, i, len(line)))
