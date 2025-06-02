#!/usr/bin/env python3

import argparse
import math
import os
import sys
import multiprocessing

parser = argparse.ArgumentParser(description='File link script')

parser.add_argument('--list', required=True)
parser.add_argument('--cellar', required=True)
parser.add_argument('--dest', required=True)

cmd_args = parser.parse_args()

src_list = []
with open(cmd_args.list, 'r') as f:
  for line in f:
    src_list.append(line.strip())

list_len = len(src_list)
proc_num = min(multiprocessing.cpu_count(), 32)
files_per_job = max(math.ceil(list_len / proc_num), 1)

def job(chunk):
  try:
    for filename in chunk:
      link_from = os.path.join(cmd_args.cellar, filename)
      link_to = os.path.join(cmd_args.dest, filename)
      if not os.path.exists(link_to):
        os.link(link_from, link_to)
    return 0
  except Exception as exc:
    print('Exception caught: {}'.format(exc))
    return 1

def run_link():
  chunks = [src_list[i:i + files_per_job] for i in range(0, list_len, files_per_job)]
  pool = multiprocessing.Pool(processes=len(chunks))
  result = pool.map(job, chunks)
  pool.close()
  pool.join()

  if 1 in result:
    sys.exit('Some job failed')

if __name__ == '__main__':
  run_link()
