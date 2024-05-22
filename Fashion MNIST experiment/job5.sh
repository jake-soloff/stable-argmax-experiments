#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -J job5
#SBATCH --mail-user=<INPUT USER NAME>
#SBATCH --mail-type=FAIL
#SBATCH -t 05:00:00
#SBATCH --account=m4212_g
#SBATCH --output=%x.out

# run 25
python fit.py subbagging 275
python fit.py loo 275 32357
 
# run 26
python fit.py subbagging 276
python fit.py loo 276 19714
 
# run 27
python fit.py subbagging 277
python fit.py loo 277 42846
 
# run 28
python fit.py subbagging 278
python fit.py loo 278 35670
 
# run 29
python fit.py subbagging 279
python fit.py loo 279 22376
 
# run 30
python fit.py subbagging 280
python fit.py loo 280 22424
 
# run 31
python fit.py subbagging 281
python fit.py loo 281 4611
 
# run 32
python fit.py subbagging 282
python fit.py loo 282 11565
 
# run 33
python fit.py subbagging 283
python fit.py loo 283 42553
 
# run 34
python fit.py subbagging 284
python fit.py loo 284 2763
 
# run 35
python fit.py subbagging 285
python fit.py loo 285 11090
 
# run 36
python fit.py subbagging 286
python fit.py loo 286 54529
 
# run 37
python fit.py subbagging 287
python fit.py loo 287 51140
 
# run 38
python fit.py subbagging 288
python fit.py loo 288 50901
 
# run 39
python fit.py subbagging 289
python fit.py loo 289 11302
 
# run 40
python fit.py subbagging 290
python fit.py loo 290 57088
 
# run 41
python fit.py subbagging 291
python fit.py loo 291 18397
 
# run 42
python fit.py subbagging 292
python fit.py loo 292 49480
 
# run 43
python fit.py subbagging 293
python fit.py loo 293 46160
 
# run 44
python fit.py subbagging 294
python fit.py loo 294 37918
 
# run 45
python fit.py subbagging 295
python fit.py loo 295 21081
 
# run 46
python fit.py subbagging 296
python fit.py loo 296 52499
 
# run 47
python fit.py subbagging 297
python fit.py loo 297 20335
 
# run 48
python fit.py subbagging 298
python fit.py loo 298 51762
 
# run 49
python fit.py subbagging 299
python fit.py loo 299 41986
 