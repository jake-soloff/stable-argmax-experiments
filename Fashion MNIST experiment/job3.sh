#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -J job3
#SBATCH --mail-user=<INPUT USER NAME>
#SBATCH --mail-type=FAIL
#SBATCH -t 05:00:00
#SBATCH --account=m4212_g
#SBATCH --output=%x.out
 
# run 26
python fit.py subbagging 176
python fit.py loo 176 14676
 
# run 27
python fit.py subbagging 177
python fit.py loo 177 5695
 
# run 28
python fit.py subbagging 178
python fit.py loo 178 34577
 
# run 29
python fit.py subbagging 179
python fit.py loo 179 33575
 
# run 30
python fit.py subbagging 180
python fit.py loo 180 2536
 
# run 31
python fit.py subbagging 181
python fit.py loo 181 43658
 
# run 32
python fit.py subbagging 182
python fit.py loo 182 9157
 
# run 33
python fit.py subbagging 183
python fit.py loo 183 43247
 
# run 34
python fit.py subbagging 184
python fit.py loo 184 45894
 
# run 35
python fit.py subbagging 185
python fit.py loo 185 27849
 
# run 36
python fit.py subbagging 186
python fit.py loo 186 27996
 
# run 37
python fit.py subbagging 187
python fit.py loo 187 20136
 
# run 38
python fit.py subbagging 188
python fit.py loo 188 37960
 
# run 39
python fit.py subbagging 189
python fit.py loo 189 27188
 
# run 40
python fit.py subbagging 190
python fit.py loo 190 54392
 
# run 41
python fit.py subbagging 191
python fit.py loo 191 3349
 
# run 42
python fit.py subbagging 192
python fit.py loo 192 5744
 
# run 43
python fit.py subbagging 193
python fit.py loo 193 9625
 
# run 44
python fit.py subbagging 194
python fit.py loo 194 6124
 
# run 45
python fit.py subbagging 195
python fit.py loo 195 19264
 
# run 46
python fit.py subbagging 196
python fit.py loo 196 46509
 
# run 47
python fit.py subbagging 197
python fit.py loo 197 4423
 
# run 48
python fit.py subbagging 198
python fit.py loo 198 55190
 
# run 49
python fit.py subbagging 199
python fit.py loo 199 47153
 