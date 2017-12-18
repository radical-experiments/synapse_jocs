import sys
import csv
from pprint import pprint

from stats import *

measure = sys.argv[1]
resource_run = sys.argv[2]
resource = resource_run.split('_')[0]

measure_dict = dict()

with open("./"+measure+"__"+resource_run+".csv") as f_in:
    reader = csv.reader(f_in)
    for row in reader:
        measure_dict[row[0]] = map(float, row[1:])


avg_measure_dict = dict()

for timestep, measure_list in measure_dict.iteritems():
    pprint(timestep)
    pprint(measure_list)
    avg_measure_dict[timestep] = [avg(measure_list), samp_std(measure_list), conf_itv(measure_list)]


with open("avg_"+measure+"__"+resource_run+".csv", "w") as f_out:
    writer = csv.writer(f_out)
    for timestep, measure_list in avg_measure_dict.iteritems():
        row = [timestep]
        row.extend(measure_list)
        pprint(row)
        writer.writerow(row)


