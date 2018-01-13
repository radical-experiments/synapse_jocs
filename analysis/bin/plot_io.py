#!/usr/bin/env python

__copyright__ = 'Copyright 2013-2016, http://radical.rutgers.edu'
__license__   = 'MIT'


import os
import sys
import pprint

import matplotlib.pyplot as plt
import numpy             as np

PWD     = os.path.dirname(os.path.dirname(__file__))
dat     = '%s/data' % PWD
plot_by = ['all', 'hosts', 'fss']

# ------------------------------------------------------------------------------
#
def main():

    data    = dict()
    hosts   = set()
    modes   = set()
    fss     = set()

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

            hosts.add(host)
            modes.add(mode)
            fss.add(fs)


  # pprint.pprint(data)

    formats = {'w0' : '-o',
               'r0' : '--o',
               'r1' : ':s',
               'r2' : '-.'}

    font = {'family' : 'normal',
          # 'weight' : 'bold',
            'size'   : 22}
    plt.rc('font', **font)

    # --------------------------------------------------------------------------
    def add_to_plt(plt, fmt, datasets):
        x = list()
        y = list()
        e = list()
        for buf in sorted(datasets.keys()):
            tmp = np.array(datasets[buf])
            x.append(buf)
            y.append(tmp.mean())
            e.append(tmp.std())
        plt.errorbar(x, y, yerr=e, fmt=fmt, linewidth=3, capthick=20,
                markersize=10)
    # --------------------------------------------------------------------------
    if 'hosts' in plot_by:
        for host in hosts:

            labels     = list()
            label_cols = 0
            plt.figure(figsize=(20,10))
            for fs in fss:
                add_label_col = False
                for mode in ['w0', 'r0', 'r1', 'r2']:
                    bufs = data.get(host, {}).get(fs, {}).get(mode)
                    if not bufs:
                        continue
                    labels.append('%5s - %s' % (fs, mode))
                    add_to_plt(plt, formats[mode], data[host][fs][mode])
                    add_label_col = True
                if add_label_col: label_cols += 1
            plt.xlabel('bufsize [byte]')
            plt.ylabel('T_x')
            plt.yscale('log')
            plt.ylim([0.1, 1000])
            plt.title ('%s: T_x over buf sizes and file systems' % host)
            plt.legend(labels, ncol=label_cols, loc='upper right')
            plt.savefig('%s/figures/io_host_%s.png' % (PWD, host))
            print 'saved %s/figures/io_host_%s.png' % (PWD, host)

    # --------------------------------------------------------------------------
    if 'fss' in plot_by:
        for fs in fss:

            labels     = list()
            label_cols = 0
            plt.figure(figsize=(20,10))
            for host in hosts:
                add_label_col = False
                for mode in ['w0', 'r0', 'r1', 'r2']:
                    bufs = data.get(host, {}).get(fs, {}).get(mode)
                    if not bufs:
                        continue
                    labels.append('%8s - %s' % (host, mode))
                    add_to_plt(plt, formats[mode], data[host][fs][mode])
                    add_label_col = True
                if add_label_col: label_cols += 1
            plt.xlabel('bufsize [byte]')
            plt.ylabel('T_x')
            plt.yscale('log')
            plt.ylim([0.1, 1000])
            plt.title ('%s: T_x over buf sizes and file systems' % fs)
            plt.legend(labels, ncol=label_cols, loc='upper right')
            plt.savefig('%s/figures/io_fs_%s.png' % (PWD, fs))
            print 'saved %s/figures/io_fs_%s.png' % (PWD, fs)

    # --------------------------------------------------------------------------
    if 'all' in plot_by:

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
                    plt.errorbar(x, y, yerr=e, linewidth=3, markersize=15, 
                                 fmt=formats[mode], capthick=20)
                  # print
                  # print label
     
        plt.xlabel('bufsize [byte]')
        plt.ylabel('T_x')
        plt.yscale('log')
        plt.ylim([0.1, 1000])
        plt.title ('T_x over buf sizes and file systems')
        plt.legend(labels, ncol=5, loc='upper right')
        plt.savefig('%s/figures/io.png' % PWD)
        print 'saved %s/figures/io.png' % PWD


# ------------------------------------------------------------------------------
#
if __name__ == '__main__':

    main()

# ------------------------------------------------------------------------------


