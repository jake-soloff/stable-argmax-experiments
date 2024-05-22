#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -J job7
#SBATCH --mail-user=<INPUT USER NAME>
#SBATCH --mail-type=FAIL
#SBATCH -t 05:00:00
#SBATCH --account=m4212_g
#SBATCH --output=%x.out
 
# run 26
python fit.py subbagging 376
python fit.py loo 376 30066
 
# run 27
python fit.py subbagging 377
python fit.py loo 377 47229
 
# run 28
python fit.py subbagging 378
python fit.py loo 378 22151
 
# run 29
python fit.py subbagging 379
python fit.py loo 379 28081
 
# run 30
python fit.py subbagging 380
python fit.py loo 380 52494
 
# run 31
python fit.py subbagging 381
python fit.py loo 381 43507
 
# run 32
python fit.py subbagging 382
python fit.py loo 382 23052
 
# run 33
python fit.py subbagging 383
python fit.py loo 383 55116
 
# run 34
python fit.py subbagging 384
python fit.py loo 384 37761
 
# run 35
python fit.py subbagging 385
python fit.py loo 385 30087
 
# run 36
python fit.py subbagging 386
python fit.py loo 386 6734
 
# run 37
python fit.py subbagging 387
python fit.py loo 387 19834
 
# run 38
python fit.py subbagging 388
python fit.py loo 388 39122
 
# run 39
python fit.py subbagging 389
python fit.py loo 389 31008
 
# run 40
python fit.py subbagging 390
python fit.py loo 390 28758
 
# run 41
python fit.py subbagging 391
python fit.py loo 391 1948
 
# run 42
python fit.py subbagging 392
python fit.py loo 392 30783
 
# run 43
python fit.py subbagging 393
python fit.py loo 393 46127
 
# run 44
python fit.py subbagging 394
python fit.py loo 394 1047
 
# run 45
python fit.py subbagging 395
python fit.py loo 395 51382
 
# run 46
python fit.py subbagging 396
python fit.py loo 396 50224
 
# run 47
python fit.py subbagging 397
python fit.py loo 397 47702
 
# run 48
python fit.py subbagging 398
python fit.py loo 398 29090
 
# run 49
python fit.py subbagging 399
python fit.py loo 399 7259
 