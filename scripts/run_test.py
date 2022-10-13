#!/usr/bin/python

import sys, os

functionName  = sys.argv[1]
folderStack   = 'app/stacks'
listStackName = [name for name in os.listdir(folderStack) if os.path.isdir(os.path.join(folderStack, name))]

def run_test():
  for stackName in listStackName :
    pathStack = os.getcwd() + '/' + folderStack + '/' + stackName

    print(pathStack)

    os.system('cd ' + pathStack + ' && ' + 'terraspace test')

print(locals()[functionName]())
