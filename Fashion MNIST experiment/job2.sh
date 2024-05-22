#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -J job2
#SBATCH --mail-user=<INPUT USER NAME>
#SBATCH --mail-type=FAIL
#SBATCH -t 04:00:00
#SBATCH --account=m4212_g
#SBATCH --output=%x.out

# run 25
python fit.py subbagging 125
python fit.py loo 125 52172
 
# run 26
python fit.py subbagging 126
python fit.py loo 126 56018
 
# run 27
python fit.py subbagging 127
python fit.py loo 127 48166
 
# run 28
python fit.py subbagging 128
python fit.py loo 128 31972
 
# run 29
python fit.py subbagging 129
python fit.py loo 129 53476
 
# run 30
python fit.py subbagging 130
python fit.py loo 130 5292
 
# run 31
python fit.py subbagging 131
python fit.py loo 131 38084
 
# run 32
python fit.py subbagging 132
python fit.py loo 132 48835
 
# run 33
python fit.py subbagging 133
python fit.py loo 133 44713
 
# run 34
python fit.py subbagging 134
python fit.py loo 134 41584
 
# run 35
python fit.py subbagging 135
python fit.py loo 135 55230
 
# run 36
python fit.py subbagging 136
python fit.py loo 136 43982
 
# run 37
python fit.py subbagging 137
python fit.py loo 137 3275
 
# run 38
python fit.py subbagging 138
python fit.py loo 138 22492
 
# run 39
python fit.py subbagging 139
python fit.py loo 139 56152
 
# run 40
python fit.py subbagging 140
python fit.py loo 140 28313
 
# run 41
python fit.py subbagging 141
python fit.py loo 141 55798
 
# run 42
python fit.py subbagging 142
python fit.py loo 142 9913
 
# run 43
python fit.py subbagging 143
python fit.py loo 143 49699
 
# run 44
python fit.py subbagging 144
python fit.py loo 144 19289
 
# run 45
python fit.py subbagging 145
python fit.py loo 145 112
 
# run 46
python fit.py subbagging 146
python fit.py loo 146 237
 
# run 47
python fit.py subbagging 147
python fit.py loo 147 37222
 
# run 48
python fit.py subbagging 148
python fit.py loo 148 13535
 
# run 49
python fit.py subbagging 149
python fit.py loo 149 53442
 