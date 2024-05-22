#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -J job8
#SBATCH --mail-user=<INPUT USER NAME>
#SBATCH --mail-type=FAIL
#SBATCH -t 05:00:00
#SBATCH --account=m4212_g
#SBATCH --output=%x.out
 
# run 26
python fit.py subbagging 426
python fit.py loo 426 56969
 
# run 27
python fit.py subbagging 427
python fit.py loo 427 46673
 
# run 28
python fit.py subbagging 428
python fit.py loo 428 32106
 
# run 29
python fit.py subbagging 429
python fit.py loo 429 47168
 
# run 30
python fit.py subbagging 430
python fit.py loo 430 8439
 
# run 31
python fit.py subbagging 431
python fit.py loo 431 57964
 
# run 32
python fit.py subbagging 432
python fit.py loo 432 10833
 
# run 33
python fit.py subbagging 433
python fit.py loo 433 14262
 
# run 34
python fit.py subbagging 434
python fit.py loo 434 38039
 
# run 35
python fit.py subbagging 435
python fit.py loo 435 30149
 
# run 36
python fit.py subbagging 436
python fit.py loo 436 19958
 
# run 37
python fit.py subbagging 437
python fit.py loo 437 54764
 
# run 38
python fit.py subbagging 438
python fit.py loo 438 47974
 
# run 39
python fit.py subbagging 439
python fit.py loo 439 56526
 
# run 40
python fit.py subbagging 440
python fit.py loo 440 42724
 
# run 41
python fit.py subbagging 441
python fit.py loo 441 27259
 
# run 42
python fit.py subbagging 442
python fit.py loo 442 43313
 
# run 43
python fit.py subbagging 443
python fit.py loo 443 11038
 
# run 44
python fit.py subbagging 444
python fit.py loo 444 55697
 
# run 45
python fit.py subbagging 445
python fit.py loo 445 8662
 
# run 46
python fit.py subbagging 446
python fit.py loo 446 55144
 
# run 47
python fit.py subbagging 447
python fit.py loo 447 56734
 
# run 48
python fit.py subbagging 448
python fit.py loo 448 44680
 
# run 49
python fit.py subbagging 449
python fit.py loo 449 38421
 