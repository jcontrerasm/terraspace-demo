#!/usr/bin/python

import sys

environment   = sys.argv[1]
defaultPath   = '/home/vsts/work/_temp/'
gcpCredential = environment + '-gcp-core-service-account.json'

print(defaultPath + gcpCredential)
