# encoding: utf-8
from __future__ import print_function

ROBOT_LIBRARY_VERSION = '1.0'


class MyClassAdd(object):
    def __init__(self, n=1):
        self._n = n

    def add(self, n1, n2=None):
        if n2 is None:
            n2 = self._n

        to_num = lambda n: float(n) if '.' in str(n) else int(n)

        return to_num(n1) + to_num(n2)

