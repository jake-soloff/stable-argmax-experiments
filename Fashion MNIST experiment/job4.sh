#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -J job4
#SBATCH --mail-user=<INPUT USER NAME>
#SBATCH --mail-type=FAIL
#SBATCH -t 05:00:00
#SBATCH --account=m4212_g
#SBATCH --output=%x.out

# run 25
python fit.py subbagging 225
python fit.py loo 225 777
 
# run 26
python fit.py subbagging 226
python fit.py loo 226 24726
 
# run 27
python fit.py subbagging 227
python fit.py loo 227 26913
 
# run 28
python fit.py subbagging 228
python fit.py loo 228 24767
 
# run 29
python fit.py subbagging 229
python fit.py loo 229 45460
 
# run 30
python fit.py subbagging 230
python fit.py loo 230 33483
 
# run 31
python fit.py subbagging 231
python fit.py loo 231 49327
 
# run 32
python fit.py subbagging 232
python fit.py loo 232 58723
 
# run 33
python fit.py subbagging 233
python fit.py loo 233 35240
 
# run 34
python fit.py subbagging 234
python fit.py loo 234 19813
 
# run 35
python fit.py subbagging 235
python fit.py loo 235 47759
 
# run 36
python fit.py subbagging 236
python fit.py loo 236 5697
 
# run 37
python fit.py subbagging 237
python fit.py loo 237 24256
 
# run 38
python fit.py subbagging 238
python fit.py loo 238 17744
 
# run 39
python fit.py subbagging 239
python fit.py loo 239 47918
 
# run 40
python fit.py subbagging 240
python fit.py loo 240 15182
 
# run 41
python fit.py subbagging 241
python fit.py loo 241 41749
 
# run 42
python fit.py subbagging 242
python fit.py loo 242 27648
 
# run 43
python fit.py subbagging 243
python fit.py loo 243 44701
 
# run 44
python fit.py subbagging 244
python fit.py loo 244 24161
 
# run 45
python fit.py subbagging 245
python fit.py loo 245 12366
 
# run 46
python fit.py subbagging 246
python fit.py loo 246 39847
 
# run 47
python fit.py subbagging 247
python fit.py loo 247 39070
 
# run 48
python fit.py subbagging 248
python fit.py loo 248 563
 
# run 49
python fit.py subbagging 249
python fit.py loo 249 23093
 