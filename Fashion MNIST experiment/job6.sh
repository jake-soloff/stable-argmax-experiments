#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -J job6
#SBATCH --mail-user=<INPUT USER NAME>
#SBATCH --mail-type=FAIL
#SBATCH -t 05:00:00
#SBATCH --account=m4212_g
#SBATCH --output=%x.out
 
# run 26
python fit.py subbagging 326
python fit.py loo 326 56255
 
# run 27
python fit.py subbagging 327
python fit.py loo 327 16746
 
# run 28
python fit.py subbagging 328
python fit.py loo 328 36647
 
# run 29
python fit.py subbagging 329
python fit.py loo 329 39267
 
# run 30
python fit.py subbagging 330
python fit.py loo 330 21534
 
# run 31
python fit.py subbagging 331
python fit.py loo 331 20155
 
# run 32
python fit.py subbagging 332
python fit.py loo 332 59751
 
# run 33
python fit.py subbagging 333
python fit.py loo 333 25028
 
# run 34
python fit.py subbagging 334
python fit.py loo 334 40909
 
# run 35
python fit.py subbagging 335
python fit.py loo 335 56313
 
# run 36
python fit.py subbagging 336
python fit.py loo 336 55210
 
# run 37
python fit.py subbagging 337
python fit.py loo 337 10689
 
# run 38
python fit.py subbagging 338
python fit.py loo 338 2750
 
# run 39
python fit.py subbagging 339
python fit.py loo 339 43743
 
# run 40
python fit.py subbagging 340
python fit.py loo 340 56535
 
# run 41
python fit.py subbagging 341
python fit.py loo 341 27808
 
# run 42
python fit.py subbagging 342
python fit.py loo 342 5997
 
# run 43
python fit.py subbagging 343
python fit.py loo 343 42186
 
# run 44
python fit.py subbagging 344
python fit.py loo 344 40870
 
# run 45
python fit.py subbagging 345
python fit.py loo 345 48003
 
# run 46
python fit.py subbagging 346
python fit.py loo 346 29093
 
# run 47
python fit.py subbagging 347
python fit.py loo 347 18468
 
# run 48
python fit.py subbagging 348
python fit.py loo 348 18027
 
# run 49
python fit.py subbagging 349
python fit.py loo 349 47151
 