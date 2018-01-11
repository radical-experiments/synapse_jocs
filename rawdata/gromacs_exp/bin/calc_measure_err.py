import sys
import csv
from pprint import pprint

from stats import *

measure = sys.argv[1]
baseline_resource_run = sys.argv[2]
resource_run = sys.argv[3]

est_measure_dict = dict()
res_measure_dict = dict()

with open("./avg_"+measure+"__"+baseline_resource_run+".csv") as f_base:
    reader = csv.reader(f_base)
    for row in reader:
        est_measure_dict[row[0]] = float(row[1])

with open("./"+measure+"__"+resource_run+".csv") as f_res:
    reader = csv.reader(f_res)
    for row in reader:
        res_measure_dict[row[0]] = map(float, row[1:])


measure_pct_err_dict = dict()
for timestep in est_measure_dict.keys():
    measure_pct_err_dict[timestep] = pct_err(res_measure_dict[timestep], est_measure_dict[timestep])

avg_measure_pct_err_dict = dict()
for timestep, pct_err_list in measure_pct_err_dict.iteritems():
    avg_measure_pct_err_dict[timestep] = [avg(pct_err_list), samp_std(pct_err_list), conf_itv(pct_err_list)]

with open("./"+measure+"_err__"+resource_run+".csv", "w") as f_out:
    writer = csv.writer(f_out)
    for timestep, measure_err in measure_pct_err_dict.iteritems():
        row = [timestep]
        row.extend(measure_err)
        pprint(row)
        writer.writerow(row)

with open("./avg_"+measure+"_err__"+resource_run+".csv", "w") as f_out:
    writer = csv.writer(f_out)
    for timestep, measure_err in avg_measure_pct_err_dict.iteritems():
        row = [timestep]
        row.extend(measure_err)
        pprint(row)
        writer.writerow(row)

