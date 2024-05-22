import numpy as np
import pickle as pkl
import os, re

from scipy.special import softmax

import matplotlib.pyplot as plt
import matplotlib.patches as patches

## specify plot options 
plt.rcParams.update({
    'axes.linewidth' : 1,
    'lines.linewidth' : 3,
    'font.size': 14,
    'axes.titlesize': 'large',   # fontsize of the axes title
    'axes.labelsize': 'large' , # fontsize of the x any y labels
    "text.usetex": True,
    'font.family': 'serif', 
    'font.serif': ['Computer Modern'],
    'text.latex.preamble' : r'\usepackage{amsmath,amsfonts}'})

## custom color palette
lblue = (40/255,103/255,178/255)
cred  = (177/255, 4/255, 14/255)
nyllw = (245/255,213/255,71/255)# Naples yellow

import torch
import torchvision
import torchvision.transforms as transforms
# PyTorch TensorBoard support
from torch.utils.tensorboard import SummaryWriter

def proj(w, j, eps):
    d = len(w)
    wj = w[j]
    w1 = np.sort(np.delete(w,j))[::-1]
    means = (w[j] + np.hstack([0,np.cumsum(w1)]))/np.arange(1,d+1)
    shrink_val = means - (eps/np.sqrt(2))/np.arange(1,d+1)
    ind = np.min(np.where(np.hstack([w1, -float('Inf')]) < shrink_val))
    w_proj = w.copy()
    if ind>0:
        w_proj[w_proj > shrink_val[ind]] = shrink_val[ind]
        w_proj[j] = shrink_val[ind] + eps/np.sqrt(2)
    return(w_proj, np.linalg.norm(w-w_proj))

def kstar(w, eps):
    d = len(w)
    k = 0
    o = np.argsort(-w)
    for i in range(d):
        j = o[i]
        _, dist = proj(w, j, eps)
        if dist < eps:
            k+=1
        else:
            break
    return k

def s(w, eps):
    k = kstar(w, eps)
    order = np.argsort(w)[::-1]
    return(set(order[:k]))

# load full
fp = 'full/1'
with open(os.path.join(fp, 'weights.pkl'), 'rb') as f:
    w_full = pkl.load(f)
n = 60000
m = int(n/2)
N, K = w_full.shape

# load leave-one-out (LOO) results
fp = 'loo/'
RUN_IDs = [fn for fn in os.listdir(fp) if '_' not in fn and '.' not in fn]
RUN_IDs = [fn for fn in RUN_IDs if 
           os.path.exists(os.path.join(fp, fn, 'weights.pkl'))]
N_loo = len(RUN_IDs)

# get the loo ids 
ns = []
for ID in RUN_IDs:
    with open(os.path.join(fp, ID, 'indices.pkl'), 'rb') as f:
        ns.append(list(set(range(n)).difference(set(pkl.load(f))))[0])

w_loo = np.zeros((N_loo, N, K))
for b, ID in enumerate(RUN_IDs):
    with open(os.path.join(fp, ID, 'weights.pkl'), 'rb') as f:
        w_loo[b] = pkl.load(f)

# load subbagging results
fp = 'subbagging/'
RUN_IDs = [fn for fn in os.listdir(fp) 
           if os.path.exists(os.path.join(fp, fn, 'weights.pkl')) 
           and fn!='RUN_ID']

B_tot = len(RUN_IDs)#+1
bags = np.zeros((B_tot, m), dtype=int)
w_bags = np.zeros((B_tot, N, K))
for b, ID in enumerate(RUN_IDs):
    with open(os.path.join(fp, ID, 'indices.pkl'), 'rb') as f:
        bags[b] = pkl.load(f)
    with open(os.path.join(fp, ID, 'weights.pkl'), 'rb') as f:
        w_bags[b] = pkl.load(f)

B = 200

w_subb = np.mean(w_bags[np.random.choice(B_tot, B, replace=False)], 0)
w_subb_= []
for i in ns:
    inds = np.where(np.all(bags!=i,1))[0]
    w_subb_.append(np.mean(w_bags[np.random.choice(inds, B, replace=False)], 0))
w_subb_ = np.array(w_subb_)

transform = transforms.Compose(
    [transforms.ToTensor(),
    transforms.Normalize((0.5,), (0.5,))])

# Create datasets for training & validation, download if necessary
validation_set = torchvision.datasets.FashionMNIST('./data', 
                                                   train=False, 
                                                   transform=transform, 
                                                   download=False)
validation_loader = torch.utils.data.DataLoader(validation_set, 
                                                batch_size=N, 
                                                shuffle=False)
for data in validation_loader:
    _, Y = data
Y = np.array(Y)

# evaluate stability
stab_base = []
stab_subb = []
for j in range(N): # N
    S = w_full[j].argmax()
    stab_base.append(np.mean(w_loo[:,j].argmax(axis=1) != S))
    S = w_subb[j].argmax()
    stab_subb.append(np.mean(w_subb_[:,j].argmax(axis=1) != S))
stab_base = np.array(stab_base)
stab_subb = np.array(stab_subb)

pow_base = (w_full.argmax(1) == Y).mean()
pow_subb = (w_subb.argmax(1) == Y).mean()

pow_base_se = (w_full.argmax(1) == Y).std() / np.sqrt(N)
pow_subb_se = (w_subb.argmax(1) == Y).std() / np.sqrt(N)

EPS = .05
stab_eps, pow_eps, size_eps = [], [], []
for j in range(N): # N
    if j%100==0: print(j)
    S = s(w_subb[j], EPS)
    ct = 0
    for i in range(N_loo):
        S_ = s(w_subb_[i,j], EPS)
        ct += 1 if (S&S_) else 0
    stab_eps.append(1 - ct/N_loo)
    size_eps.append(len(S))
    pow_eps.append(set([Y[j]]) == S)
stab_eps = np.array(stab_eps)
size_eps = np.array(size_eps)
pow_eps  = np.array(pow_eps)

pow_eps_se = np.std(pow_eps)/np.sqrt(N)
print(' base algo. prec: %.3f' % np.mean(pow_base), 
      '(%.3f)'%pow_base_se, ', size: 1.000 (0.000)\n',
       'subbagging prec: %.3f' % np.mean(pow_subb), 
       '(%.3f)'%pow_subb_se, ', size: 1.000 (0.000)\n',
       'subb+infl. prec: %.3f' % np.mean(pow_eps),  
       '(%.3f)'% pow_eps_se, ', size: %.3f (%.3f)'
      % (np.mean(size_eps), np.std(size_eps)/np.sqrt(N))
     )

# plot survival functions
def plot_sf(arr, c, lab=None, ls='-'):
    size = len(arr)
    plt.step(np.sort(arr)[::-1], np.arange(size)/size, 
             where='post', c=c, 
             label=lab, ls=ls)

plt.figure(figsize=(10,5))

plot_sf(stab_base, cred, 
        '$\\textnormal{argmax}\\circ\\mathcal{A}$')
plot_sf(stab_subb, nyllw, 
        '$\\textnormal{argmax}\\circ\\widetilde{\\mathcal{A}}_m$')
plot_sf(stab_eps, lblue, 
        '$\\textnormal{argmax}^\\varepsilon\\circ\\widetilde{\\mathcal{A}}_m$')

plt.semilogy()
plt.legend(loc='upper right')

plt.gca().spines['top'].set_color('none')
plt.gca().spines['right'].set_color('none')

plt.xticks([0, .5, 1])

plt.xlabel('$\\delta$', fontsize=20)
plt.ylabel('$\\frac{1}{N}\sum_{j\in [N]}1\\{\\delta_j > \\delta\\}$', 
           fontsize=20, labelpad=20)

plt.ylim([0,2])
plt.xlim([0,1.01])
plt.tight_layout()
plt.savefig('instability.pdf')
plt.show()