#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -J job0
#SBATCH --mail-user=<INPUT USER NAME>
#SBATCH --mail-type=FAIL
#SBATCH -t 05:00:00
#SBATCH --account=m4212_g
#SBATCH --output=%x.out
 
python fit.py full 1

# run 25
python fit.py subbagging 25
python fit.py loo 25 8993
 
# run 26
python fit.py subbagging 26
python fit.py loo 26 29686
 
# run 27
python fit.py subbagging 27
python fit.py loo 27 4447
 
# run 28
python fit.py subbagging 28
python fit.py loo 28 31735
 
# run 29
python fit.py subbagging 29
python fit.py loo 29 34532
 
# run 30
python fit.py subbagging 30
python fit.py loo 30 47640
 
# run 31
python fit.py subbagging 31
python fit.py loo 31 12089
 
# run 32
python fit.py subbagging 32
python fit.py loo 32 7750
 
# run 33
python fit.py subbagging 33
python fit.py loo 33 46474
 
# run 34
python fit.py subbagging 34
python fit.py loo 34 57194
 
# run 35
python fit.py subbagging 35
python fit.py loo 35 40721
 
# run 36
python fit.py subbagging 36
python fit.py loo 36 36184
 
# run 37
python fit.py subbagging 37
python fit.py loo 37 59065
 
# run 38
python fit.py subbagging 38
python fit.py loo 38 50034
 
# run 39
python fit.py subbagging 39
python fit.py loo 39 50490
 
# run 40
python fit.py subbagging 40
python fit.py loo 40 2073
 
# run 41
python fit.py subbagging 41
python fit.py loo 41 10945
 
# run 42
python fit.py subbagging 42
python fit.py loo 42 53676
 
# run 43
python fit.py subbagging 43
python fit.py loo 43 10378
 
# run 44
python fit.py subbagging 44
python fit.py loo 44 56861
 
# run 45
python fit.py subbagging 45
python fit.py loo 45 2186
 
# run 46
python fit.py subbagging 46
python fit.py loo 46 21516
 
# run 47
python fit.py subbagging 47
python fit.py loo 47 27323
 
# run 48
python fit.py subbagging 48
python fit.py loo 48 20999
 
# run 49
python fit.py subbagging 49
python fit.py loo 49 16389
 