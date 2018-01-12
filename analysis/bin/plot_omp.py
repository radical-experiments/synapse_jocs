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
    with open('%s/omp.dat' % dat, 'r') as fin:
        for line in fin.readlines():
            host, mode, cnt, n, t = line.split()

            cnt = int  (cnt)
            n   = int  (n)
            t   = float(t)

            if cnt not in [1, 4, 8, 12, 16, 20]:
                continue

            if host not in data            : data[host]            = dict()
            if mode not in data[host]      : data[host][mode]      = dict()
            if cnt  not in data[host][mode]: data[host][mode][cnt] = list()

            data[host][mode][cnt].append(t)

  # pprint.pprint(data)

    formats = {'omp' : '--o',
               'mpi' : '-*' }

    labels = list()
    plt.figure(figsize=(20,10))
    for host in data:
        for mode in ['omp', 'mpi']:
            label = '%-7s - %-3s' % (host, mode)
            labels.append(label)
            x = list()
            y = list()
            e = list()
            for cnt in sorted(data[host][mode].keys()):
                tmp = np.array(data[host][mode][cnt])
              # print label, tmp
                x.append(cnt)
                y.append(tmp.mean())
                e.append(tmp.std())
            plt.errorbar(x, y, yerr=e) #, fmt=formats[mode], capthick=20)
          # print
          # print label

    plt.xlabel('# threads or processes [byte]')
    plt.ylabel('T_x')
  # plt.yscale('log')
    plt.title ('T_x over threads / processes')
    plt.legend(labels, ncol=2, loc='upper left', bbox_to_anchor=(0,1.13))
    plt.savefig('%s/figures/omp.png' % PWD)
    plt.show()


# ------------------------------------------------------------------------------
#
if __name__ == '__main__':

    main()

# ------------------------------------------------------------------------------


