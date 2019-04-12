# encoding: utf-8
from __future__ import print_function

class MyLibClass(object):
    def __init__(self, name="world"):
        self._name = name

    def say_hello(self):
        print('Hello', self._name)

