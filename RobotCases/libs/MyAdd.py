# encoding: utf-8
from __future__ import print_function

ROBOT_LIBRARY_VERSION = '1.0'


def add(n1, n2=1):
    to_num = lambda n: float(n) if '.' in str(n) else int(n)

    return to_num(n1) + to_num(n2)

