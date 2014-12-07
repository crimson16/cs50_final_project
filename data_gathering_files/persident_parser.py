# f = open('/Users/tyrocca/Dropbox/cs50_final_project/static/data/2012_election.csv')
# csv_f = csv.reader(f)

# for row in csv_f:
#   pollster = row[0] 
#   start_date = row[1] 
#   end_date = row[2] 
#   entry_date = row[3] 
#   number_of_observations = row[4] 
#   population = row[5]
#   mode = row[6] 
#   romney = row[7]
#   obama = row[8]
#   undecided = row[9]
#   pollster_url = row[10]
#   source_url = row[11]
#   partisan = row[12] 
#   affiliation = row[13]

import csv

from django.db import models
from polls.models import PresidentElection

def check_empty (val):
    if val == '':
        return 0
    else:
        return val

with open('/Users/tyrocca/Dropbox/cs50_final_project/static/data/2012_election.csv', 'rU') as f:
    reader = csv.reader(f)
    for i, state in enumerate(reader):
        if i > 0:

            _state = state[0]
            _dem_electoral = check_empty(state[1])
            _rep_electoral = check_empty(state[2])
            _dem_num = float(state[3])
            _rep_num = float(state[4])
            _other_num = float(state[5])
            _total_num = float(state[6])
            _rep_pct = (_rep_num * 100.0)/_total_num
            _dem_pct = (_dem_num * 100.0)/_total_num
            _other_pct = (_other_num * 100.0)/_total_num

            pres_obj = PresidentElection(state = _state,
                    dem_electoral = _dem_electoral,
                    rep_electoral = _rep_electoral,
                    dem_num = _dem_num,
                    rep_num = _rep_num,
                    other_num = _other_num,
                    total_num = _total_num,
                    rep_pct = _rep_pct,
                    dem_pct = _dem_pct,
                    other_pct = _other_pct)
                    

            # print _other_pct
            try:
                pres_obj.save()
                pass
            except Exception, e:
                raise e
                print "~ Error ~"
