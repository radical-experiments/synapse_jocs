#!/usr/bin/env python

__copyright__ = 'Copyright 2013-2016, http://radical.rutgers.edu'
__license__   = 'MIT'


import os
import sys
import pprint

import matplotlib.pyplot as plt
import numpy             as np

import radical.analytics as ra

PWD = os.path.dirname(os.path.dirname(__file__))
dat = '%s/data' % PWD

# ------------------------------------------------------------------------------
#
def main():

    data    = dict()
    with open('%s/io.dat' % dat, 'r') as fin:
        for line in fin.readlines():
            host, fs, mode, buf, n, t = line.split()

            buf = int  (buf)
            n   = int  (n)
            t   = float(t)

            if host not in data                : data[host]                = dict()
            if fs   not in data[host]          : data[host][fs]            = dict()
            if mode not in data[host][fs]      : data[host][fs][mode]      = dict()
            if buf  not in data[host][fs][mode]: data[host][fs][mode][buf] = list()

            data[host][fs][mode][buf].append(t)

  # pprint.pprint(data)

    formats = {'w0' : '--o',
               'r0' : '--*',
               'r1' : '-^',
               'r2' : '-v'}


    labels = list()
    plt.figure(figsize=(20,10))
    for host in data:
        for fs in data[host]:
            for mode in ['w0', 'r0', 'r1', 'r2']:
                label = '%s - %s - %s' % (host, fs, mode)
                labels.append(label)
                x = list()
                y = list()
                e = list()
                for buf in sorted(data[host][fs][mode].keys()):
                    tmp = np.array(data[host][fs][mode][buf])
                  # print label, tmp
                    x.append(buf)
                    y.append(tmp.mean())
                    e.append(tmp.std())
                plt.errorbar(x, y, yerr=e, fmt=formats[mode], capthick=20)
              # print
              # print label

    plt.xlabel('bufsize [byte]')
    plt.ylabel('T_x')
    plt.yscale('log')
    plt.title ('T_x over buf sizes and file systems')
    plt.legend(labels, ncol=5, loc='upper left', bbox_to_anchor=(0,1.13))
    plt.savefig('%s/figures/io.png' % PWD)
    plt.show()


# ------------------------------------------------------------------------------
#
if __name__ == '__main__':

    main()

# ------------------------------------------------------------------------------


