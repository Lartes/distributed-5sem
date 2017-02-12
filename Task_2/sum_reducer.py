#! /usr/bin/env python
# -*- coding: utf-8 -*-

import sys

reload(sys)
sys.setdefaultencoding('utf-8')

current_hero = None
current_sum = 0
number_replics = 1
number_prev = None
hero = None


def print_line():
    print("{}\t{}\t{}\t{}".format(current_hero, current_sum, number_replics, float(current_sum)/number_replics))

for line in sys.stdin:
    line, count = line.strip().split()
    hero = line.split('_')[0]
    number = line.split('_')[1]

    if count.isdigit():
        count = int(count)
    else:
        continue

    if hero == current_hero:
        current_sum += count
        if number == number_prev:
            continue
        else:
            number_replics += 1
            number_prev = number
    else:
        if current_hero:
            print_line()
        current_hero = hero
        current_sum = count
        number_prev = number
        number_replics = 1

if current_hero == hero:
    print_line()
