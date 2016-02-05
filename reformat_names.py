#!/usr/bin/env python3
import argparse
import sys


if __name__ == '__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument('infile', type=argparse.FileType('r'))
  parser.add_argument('outfile', nargs='?', type=argparse.FileType('w'),
                      default=sys.stdout)
  args = parser.parse_args()
  next(args.infile)  # Skip the first line
  names = [line.split(':')[0].strip() for line in args.infile]
  names.append('anomaly')  # append the label
  # Note that there is no period in the end
  args.outfile.write(','.join(names) + '\n')
