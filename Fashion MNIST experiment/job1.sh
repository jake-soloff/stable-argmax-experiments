#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -J job1
#SBATCH --mail-user=<INPUT USER NAME>
#SBATCH --mail-type=FAIL
#SBATCH -t 05:00:00
#SBATCH --account=m4212_g
#SBATCH --output=%x.out
 
# run 26
python fit.py subbagging 76
python fit.py loo 76 11730
 
# run 27
python fit.py subbagging 77
python fit.py loo 77 34438
 
# run 28
python fit.py subbagging 78
python fit.py loo 78 53599
 
# run 29
python fit.py subbagging 79
python fit.py loo 79 32204
 
# run 30
python fit.py subbagging 80
python fit.py loo 80 32486
 
# run 31
python fit.py subbagging 81
python fit.py loo 81 57248
 
# run 32
python fit.py subbagging 82
python fit.py loo 82 25521
 
# run 33
python fit.py subbagging 83
python fit.py loo 83 22520
 
# run 34
python fit.py subbagging 84
python fit.py loo 84 59912
 
# run 35
python fit.py subbagging 85
python fit.py loo 85 37223
 
# run 36
python fit.py subbagging 86
python fit.py loo 86 59823
 
# run 37
python fit.py subbagging 87
python fit.py loo 87 34477
 
# run 38
python fit.py subbagging 88
python fit.py loo 88 34392
 
# run 39
python fit.py subbagging 89
python fit.py loo 89 58024
 
# run 40
python fit.py subbagging 90
python fit.py loo 90 32096
 
# run 41
python fit.py subbagging 91
python fit.py loo 91 10463
 
# run 42
python fit.py subbagging 92
python fit.py loo 92 7147
 
# run 43
python fit.py subbagging 93
python fit.py loo 93 59911
 
# run 44
python fit.py subbagging 94
python fit.py loo 94 5482
 
# run 45
python fit.py subbagging 95
python fit.py loo 95 47552
 
# run 46
python fit.py subbagging 96
python fit.py loo 96 32145
 
# run 47
python fit.py subbagging 97
python fit.py loo 97 18683
 
# run 48
python fit.py subbagging 98
python fit.py loo 98 23212
 
# run 49
python fit.py subbagging 99
python fit.py loo 99 44814
 