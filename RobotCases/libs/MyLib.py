# encoding: utf-8
from __future__ import print_function

ROBOT_LIBRARY_VERSION = '1.0'

count = 0

def sayHello(name):
    global count
    count += 1
    print('Hello', name)

def printCount():
    print('count =', count)

from robot.libraries.BuiltIn import BuiltIn
def open_baidu():
    b = BuiltIn()
    b.run_keyword('Import Library', 'SeleniumLibrary')
    b.run_keyword('Open Browser', 'http://www.baidu.com', 'browser=chrome')
    b.run_keyword('Title Should Be', u'百度一下，你就知道')
    b.run_keyword('Close All Browsers')

def should_be_nice(v):
    if v != 'nice':
        raise Exception(
            '*HTML* value <a href="http://cn.bing.com/dict/search?q=%s">%s</a> is not so nice.' % (v, v,)
        )

