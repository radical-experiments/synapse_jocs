import csv
import sys
from pprint import pprint
from matplotlib import pyplot as plt


resource = sys.argv[1]

gromacs_data = list()
asm_matmult_data = list()
c_matmult_data = list()

asm_matmult_err_data = list()
c_matmult_err_data = list()

with open('time__'+resource+'_asm_matmult.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        fmt_row = [int(row[0])]
        fmt_row.extend(map(float, row[1:]))
        asm_matmult_data.append(fmt_row)

with open('time__'+resource+'_c_matmult.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        fmt_row = [int(row[0])]
        fmt_row.extend(map(float, row[1:]))
        c_matmult_data.append(fmt_row)

with open('time__'+resource+'_gromacs.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        fmt_row = [int(row[0])]
        fmt_row.extend(map(float, row[1:]))
        gromacs_data.append(fmt_row)

asm_matmult_data.sort(key=lambda x: x[0])
c_matmult_data.sort(key=lambda x: x[0])
gromacs_data.sort(key=lambda x: x[0])

bin_settings = ['equal', 'capped']

for bin_setting in bin_settings:
    for timestep_idx in range(len(asm_matmult_data)):

        plt.close('all')
        plt.rcParams["figure.figsize"] = [12, 5]
        fig, ax = plt.subplots()
        ax.set_title("Number of Cycles, for each simulation timesteps", fontsize=20)

        asm_min = min(asm_matmult_data[timestep_idx][1:])
        asm_max = max(asm_matmult_data[timestep_idx][1:])
        c_min = min(c_matmult_data[timestep_idx][1:])
        c_max = max(c_matmult_data[timestep_idx][1:])
        grom_min = min(gromacs_data[timestep_idx][1:])
        grom_max = max(gromacs_data[timestep_idx][1:])

        asm_width = asm_max - asm_min
        c_width = c_max - c_min
        grom_width = grom_max - grom_min

        data_widths = [asm_width, c_width, grom_width]
        min_width = 1000000.0
        for width in data_widths:
            if width < min_width:
                min_width = width

        if min_width == asm_width:
            asm_num_bins = 10.0
            asm_bin_width = asm_width / asm_num_bins

            if bin_setting == 'equal':
                c_num_bins = round(c_width / asm_bin_width)
                grom_num_bins = round(grom_width / asm_bin_width)
            elif bin_setting == 'capped':
                c_num_bins = min(round(c_width / asm_bin_width), 20.0)
                grom_num_bins = min(round(grom_width / asm_bin_width), 20.0)

        elif min_width == c_width:
            c_num_bins = 10.0
            c_bin_width = c_width / c_num_bins

            if bin_setting == 'equal':
                asm_num_bins = round(asm_width / c_bin_width)
                grom_num_bins = round(grom_width / c_bin_width)
            elif bin_setting == 'capped':
                asm_num_bins = min(round(asm_width / c_bin_width), 20.0)
                grom_num_bins = min(round(grom_width / c_bin_width), 20.0)
            
        else:
            grom_num_bins = 10.0
            grom_bin_width = grom_width / grom_num_bins

            if bin_setting == 'equal':
                asm_num_bins = round(asm_width / grom_bin_width)
                c_num_bins = round(c_width / grom_bin_width)
            elif bin_setting == 'capped':
                asm_num_bins = min(round(asm_width / grom_bin_width), 20.0)
                c_num_bins = min(round(c_width / grom_bin_width), 20.0)

        asm_num_bins, c_num_bins, grom_num_bins = int(asm_num_bins), int(c_num_bins), int(grom_num_bins)
        #print asm_num_bins, c_num_bins, grom_num_bins

        ax.hist(asm_matmult_data[timestep_idx][1:], bins=asm_num_bins, alpha=0.7, color='green', edgecolor='green', label='ASM_MatMult')
        ax.hist(c_matmult_data[timestep_idx][1:], bins=c_num_bins, alpha=0.7, color='red', edgecolor='red', label='C_MatMult')
        ax.hist(gromacs_data[timestep_idx][1:], bins=grom_num_bins, alpha=0.7, color='blue', edgecolor='blue', label='Acutal')

        #ax.set_xlim(950, 105000)
        if bin_setting == 'equal':
            ax.set_ylim(0, 30)
        elif bin_setting == 'capped':
            ax.set_ylim(0, 50)

        ax.xaxis.set_tick_params(labelsize=14)
        ax.yaxis.set_tick_params(labelsize=14)

        ax.set_xlabel('Execution Time (s)', fontsize=14)
        ax.set_ylabel('Count', fontsize=14)

        ax.legend(loc='upper right')

        plt.savefig('hist_time_'+resource+'_'+str(asm_matmult_data[timestep_idx][0])+'_'+bin_setting+'.pdf', bbox_inches='tight', dpi=144)
        plt.savefig('hist_time_'+resource+'_'+str(asm_matmult_data[timestep_idx][0])+'_'+bin_setting+'.png', bbox_inches='tight', dpi=144)
