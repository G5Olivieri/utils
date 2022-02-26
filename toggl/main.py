#!/usr/bin/env python3

import subprocess
import sys
import csv
from collections import defaultdict
from datetime import datetime

def usage(name):
  print('Usage:')
  print(f'\t{name} [FILE]')

if __name__ == '__main__':
  if len(sys.argv) < 2:
    usage(sys.argv[0])
    sys.exit(0)

  file_name=sys.argv[1]
  with open(file_name, newline='') as f:
    content = csv.DictReader(f)
    sheets = []
    for line in content:
      tmp = { key: line[key] for key in ['Start date', 'Start time', 'End time', 'Client', 'Project', 'Description'] }
      tmp['null'] = 'null'
      sheets.append(tmp)

    res = {}
    for index, line in enumerate(sheets):
      if line["Start date"] in res:
        if datetime.strptime(line["End time"], "%H:%M:%S") < datetime.strptime(res[line["Start date"]], "%H:%M:%S"):
          print(f"Error on line {index}")
          sys.exit(1)
      res[line['Start date']] = line['End time']

    print('\n'.join([','.join([x[y] for y in ['Start date', 'Start time', 'End time', 'null', 'Client', 'Project', 'Description']]) for x in sheets]))
