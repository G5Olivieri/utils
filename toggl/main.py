#!/usr/bin/env python3

import subprocess
import sys
import csv

def execute_process(cmd):
  p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
  stdout, stderr = p.communicate()
  return [x for x in stdout.decode('utf-8').split('\n') if x != '']

def usage(name):
  print('Usage:')
  print(f'\t{name} [FILE]')

if __name__ == '__main__':
  if len(sys.argv) < 2:
    usage(sys.argv[0])
    sys.exit(0)

  file_name=sys.argv[1]
  client=execute_process(f'./extract.sh client {file_name}')
  project=execute_process(f'./extract.sh project {file_name}')
  task=execute_process(f'./extract.sh task {file_name}')
  day=execute_process(f'./extract.sh day {file_name}')
  start=execute_process(f'./extract.sh start {file_name}')
  end=execute_process(f'./extract.sh end {file_name}')
  for x in range(len(day)):
    line=','.join([day[x], start[x], end[x], 'null', client[x], project[x], task[x]])
    print(line)
