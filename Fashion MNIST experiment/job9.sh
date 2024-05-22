#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -J job9
#SBATCH --mail-user=<INPUT USER NAME>
#SBATCH --mail-type=FAIL
#SBATCH -t 05:00:00
#SBATCH --account=m4212_g
#SBATCH --output=%x.out
 
# run 26
python fit.py subbagging 476
python fit.py loo 476 2463
 
# run 27
python fit.py subbagging 477
python fit.py loo 477 56563
 
# run 28
python fit.py subbagging 478
python fit.py loo 478 35088
 
# run 29
python fit.py subbagging 479
python fit.py loo 479 52058
 
# run 30
python fit.py subbagging 480
python fit.py loo 480 23695
 
# run 31
python fit.py subbagging 481
python fit.py loo 481 2620
 
# run 32
python fit.py subbagging 482
python fit.py loo 482 593
 
# run 33
python fit.py subbagging 483
python fit.py loo 483 23710
 
# run 34
python fit.py subbagging 484
python fit.py loo 484 4620
 
# run 35
python fit.py subbagging 485
python fit.py loo 485 36278
 
# run 36
python fit.py subbagging 486
python fit.py loo 486 3987
 
# run 37
python fit.py subbagging 487
python fit.py loo 487 58331
 
# run 38
python fit.py subbagging 488
python fit.py loo 488 38702
 
# run 39
python fit.py subbagging 489
python fit.py loo 489 36478
 
# run 40
python fit.py subbagging 490
python fit.py loo 490 30484
 
# run 41
python fit.py subbagging 491
python fit.py loo 491 30205
 
# run 42
python fit.py subbagging 492
python fit.py loo 492 3598
 
# run 43
python fit.py subbagging 493
python fit.py loo 493 26788
 
# run 44
python fit.py subbagging 494
python fit.py loo 494 4988
 
# run 45
python fit.py subbagging 495
python fit.py loo 495 2902
 
# run 46
python fit.py subbagging 496
python fit.py loo 496 37928
 
# run 47
python fit.py subbagging 497
python fit.py loo 497 14366
 
# run 48
python fit.py subbagging 498
python fit.py loo 498 27556
 
# run 49
python fit.py subbagging 499
python fit.py loo 499 44601
 