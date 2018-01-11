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

with open('avg_instr_act__'+resource+'_asm_matmult.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        fmt_row = [int(row[0])]
        fmt_row.extend(map(float, row[1:]))
        asm_matmult_data.append(fmt_row)

with open('avg_instr_act__'+resource+'_c_matmult.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        fmt_row = [int(row[0])]
        fmt_row.extend(map(float, row[1:]))
        c_matmult_data.append(fmt_row)

with open('avg_instr_act__'+resource+'_gromacs.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        fmt_row = [int(row[0])]
        fmt_row.extend(map(float, row[1:]))
        gromacs_data.append(fmt_row)

asm_matmult_data.sort(key=lambda x: x[0])
z_asm_matmult_data = map(list, zip(*asm_matmult_data))
c_matmult_data.sort(key=lambda x: x[0])
z_c_matmult_data = map(list, zip(*c_matmult_data))
gromacs_data.sort(key=lambda x: x[0])
z_gromacs_data = map(list, zip(*gromacs_data))


with open('avg_instr_act_err__'+resource+'_asm_matmult.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        fmt_row = [int(row[0])]
        fmt_row.extend(map(float, row[1:]))
        asm_matmult_err_data.append(fmt_row)

with open('avg_instr_act_err__'+resource+'_c_matmult.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        fmt_row = [int(row[0])]
        fmt_row.extend(map(float, row[1:]))
        c_matmult_err_data.append(fmt_row)

asm_matmult_err_data.sort(key=lambda x: x[0])
z_asm_matmult_err_data = map(list, zip(*asm_matmult_err_data))
c_matmult_err_data.sort(key=lambda x: x[0])
z_c_matmult_err_data = map(list, zip(*c_matmult_err_data))

plt.close('all')
plt.rcParams["figure.figsize"] = [12, 5]
fig, ax = plt.subplots()
ax.set_title("Average Number of Instructions, for each simulation timesteps", fontsize=20)

x = z_gromacs_data[0]
actual_line = ax.errorbar(x, z_gromacs_data[1], yerr=z_gromacs_data[3], label='Actual',color='blue')
asm_line = ax.errorbar(x, z_asm_matmult_data[1], yerr=z_asm_matmult_data[3], label='ASM_MatMult', color='green')
c_line = ax.errorbar(x, z_c_matmult_data[1], yerr=z_c_matmult_data[3], label='C_MatMult', color='red')

ax.set_xscale('log')
ax.set_yscale('log')

ax.set_xlim(950, 105000)
ax.set_ylim(100000000000, 50000000000000)

ax.xaxis.set_tick_params(labelsize=14)
ax.yaxis.set_tick_params(labelsize=14)

ax.set_xlabel('Number of Timesteps', fontsize=14)
ax.set_ylabel('Number of Instructions', fontsize=14)

ax2 = ax.twinx()

asm_err_line = ax2.errorbar(x, z_asm_matmult_err_data[1], yerr=z_asm_matmult_err_data[3], label='ASM_MatMult_Error', color='green', linestyle='--')
c_err_line = ax2.errorbar(x, z_c_matmult_err_data[1], yerr=z_c_matmult_err_data[3], label='C_MatMult_Error', color='red', linestyle='--')

ax2.set_ylim(0, 100)
ax2.yaxis.set_tick_params(labelsize=14)
ax2.set_ylabel('Percent Error from Actual Runs (%)', fontsize=14)

instr_act_lines, instr_act_labels = ax.get_legend_handles_labels()
instr_act_err_lines, instr_act_err_labels = ax2.get_legend_handles_labels()
ax.legend(instr_act_lines + instr_act_err_lines, instr_act_labels + instr_act_err_labels, loc='upper left')

#plt.show()

plt.savefig('avg_instr_act_'+resource+'.pdf', bbox_inches='tight', dpi=144)
plt.savefig('avg_instr_act_'+resource+'.png', bbox_inches='tight', dpi=144)
