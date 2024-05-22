## Code to generate additional figures besides Fashion MNIST results
import numpy as np
import matplotlib.pyplot as plt

## custom color palette
lblue = (40/255,103/255,178/255)
cred  = (177/255, 4/255, 14/255)
nyllw = (245/255,213/255,71/255)# Naples yellow
orange = (255/255,124/255,60/255)

## specify plot options 
plt.rcParams.update({
    'axes.linewidth' : 2,
    'font.size': 18,
    "text.usetex": True,
    'font.family': 'serif', 
    'font.serif': ['Computer Modern'],
    'text.latex.preamble' : r'\usepackage{amsmath,amsfonts}'})


######## Inflated argmax
b = 2*np.pi/3-np.linspace(0, 2*np.pi/3, 1000)

N = 3
x = 2*np.cos(np.pi/(2*N))*np.cos(.5*(b+np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))) - np.cos(np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))
y = 2*np.cos(np.pi/(2*N))*np.sin(.5*(b+np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))) - np.sin(np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))

th = np.pi/6
R = np.array([[np.cos(th), np.sin(th)],
              [-np.sin(th), np.cos(th)]])
x,y = R@np.array([x, y])

E = .15
x,y = E*x, E*y

p0 = np.array([0,1])
v = (p0 - np.array([-np.sqrt(3)/2, -.5]))[:,np.newaxis]
p = np.array([x[0], y[0]])
U = v@v.T / (v.T@v)
x_, y_ = U@p+(np.eye(2)-U)@p0

pts = np.hstack([[x, y], [[x[-1], -np.sqrt(3)/2, x_], [-.5, -.5, y_]]])
x, y = pts

plt.figure(figsize=(7,7*3/4))

th = 2*np.pi/3
R = np.array([[np.cos(th), np.sin(th)],
              [-np.sin(th), np.cos(th)]])


### PLOT REGIONS
plt.fill(*(R@R@pts), color=cred, alpha=.5)
plt.fill(*pts, color=lblue, alpha=.6)
plt.fill(*(R@pts), color=nyllw, alpha=.5)

b = np.linspace(0, 2*np.pi, 1000)
x = 2*np.cos(np.pi/(2*N))*np.cos(.5*(b+np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))) - np.cos(np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))
y = 2*np.cos(np.pi/(2*N))*np.sin(.5*(b+np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))) - np.sin(np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))
th = np.pi/6
R = np.array([[np.cos(th), np.sin(th)],
              [-np.sin(th), np.cos(th)]])
x,y = R@np.array([x, y])
x,y = E*x, E*y
plt.fill(x, y, color='k', alpha=.1)

VERT = -.5*(2/3) + .25*(1/3) -.06
plt.text(-.06, .5, '$\{2\}$')
plt.text(-.135, -.02, '$\{1,2,3\}$', fontsize=16)

plt.text(-np.sqrt(3)/2*(2/3) + np.sqrt(3)/4*(1/3)-.06, VERT, '$\{1\}$')
plt.text(np.sqrt(3)/2*(2/3) - np.sqrt(3)/4*(1/3)-.04, VERT, '$\{3\}$')
plt.text((-np.sqrt(3)/2*(2/3) + np.sqrt(3)/4*(1/3))/2-.1,(.5+-.5*(2/3) + .25*(1/3))/2-.02, '$\{1,2\}$')
plt.text(-(-np.sqrt(3)/2*(2/3) + np.sqrt(3)/4*(1/3))/2-.09,(.5+-.5*(2/3) + .25*(1/3))/2-.02, '$\{2,3\}$')

plt.text(-np.sqrt(3)/2-.14, -.57, '$(1,0,0)$')
plt.text(np.sqrt(3)/2-.1, -.57, '$(0,0,1)$')
plt.text(-.13, 1.01, '$(0,1,0)$')

plt.text(-.1, VERT, '$\{1,3\}$')

plt.xlim([-1,1])
plt.ylim([-.5,1])
plt.gca().spines['top'].set_color('none')
plt.gca().spines['bottom'].set_color('none')
plt.gca().spines['left'].set_color('none')
plt.gca().spines['right'].set_color('none')

plt.xticks([])
plt.yticks([])

plt.savefig('reuleaux.pdf')

plt.show()

######## Fixed-margin
plt.figure(figsize=(7,7*3/4))

b = 2*np.pi/3-np.linspace(0, 2*np.pi/3, 1000)

N = 3
x = 2*np.cos(np.pi/(2*N))*np.cos(.5*(b+np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))) - np.cos(np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))
y = 2*np.cos(np.pi/(2*N))*np.sin(.5*(b+np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))) - np.sin(np.pi/N*(2*np.floor(N*b/(2*np.pi))+1))

th = np.pi/6
R = np.array([[np.cos(th), np.sin(th)],
              [-np.sin(th), np.cos(th)]])
x,y = R@np.array([x, y])

E = .15
x,y = E*x, E*y

p0 = np.array([0,1])
v = (p0 - np.array([-np.sqrt(3)/2, -.5]))[:,np.newaxis]
p = np.array([x[0], y[0]])
U = v@v.T / (v.T@v)
x_, y_ = U@p+(np.eye(2)-U)@p0

pts = np.hstack([[x, y], [[x[-1], -np.sqrt(3)/2, x_], [-.5, -.5, y_]]])
x, y = pts

th = 2*np.pi/3
R = np.array([[np.cos(th), np.sin(th)],
              [-np.sin(th), np.cos(th)]])


a,b,c,d = pts[:,(-4, -3, 0, -1)].T
s = ((a-c)/(d-c-b+a))[0]
h = a+s*(b-a)

pts = np.vstack([b, a, h, c, d, pts[:, -2]]).T

plt.fill(*(R@R@pts), color=cred, alpha=.5)
plt.fill(*pts, color=lblue, alpha=.6)
plt.fill(*(R@pts), color=nyllw, alpha=.5)

plt.text(-np.sqrt(3)/2-.14, -.57, '$(1,0,0)$')
plt.text(np.sqrt(3)/2-.1, -.57, '$(0,0,1)$')
plt.text(-.13, 1.01, '$(0,1,0)$')

plt.text(-.06, .5, '$\{2\}$')
plt.text(-np.sqrt(3)/2*(2/3) + np.sqrt(3)/4*(1/3)-.06, VERT, '$\{1\}$')
plt.text(np.sqrt(3)/2*(2/3) - np.sqrt(3)/4*(1/3)-.04, VERT, '$\{3\}$')

plt.text(-.135, -.02, '$\{1,2,3\}$', fontsize=16)
plt.text((-np.sqrt(3)/2*(2/3) + np.sqrt(3)/4*(1/3))/2-.1,(.5+-.5*(2/3) + .25*(1/3))/2-.02, '$\{1,2\}$')
plt.text(-(-np.sqrt(3)/2*(2/3) + np.sqrt(3)/4*(1/3))/2-.09,(.5+-.5*(2/3) + .25*(1/3))/2-.02, '$\{2,3\}$')
plt.text(-.1, VERT, '$\{1,3\}$')

plt.xlim([-1,1])
plt.ylim([-.5,1])
plt.gca().spines['top'].set_color('none')
plt.gca().spines['bottom'].set_color('none')
plt.gca().spines['left'].set_color('none')
plt.gca().spines['right'].set_color('none')

plt.xticks([])
plt.yticks([])

plt.savefig('hexagon-diagram.pdf')

plt.show()


######## Standard argmax
pts = np.array([[0, -np.sqrt(3)/2,  -np.sqrt(3)/4, 0], [-.5, -.5, .25, 0]])
x, y = pts

plt.figure(figsize=(7,7*3/4))

th = 2*np.pi/3
R = np.array([[np.cos(th), np.sin(th)],
              [-np.sin(th), np.cos(th)]])


### PLOT REGIONS
plt.fill(*(R@R@pts), color=cred, alpha=.5)
plt.fill(*pts, color=lblue, alpha=.6)
plt.fill(*(R@pts), color=nyllw, alpha=.5)

plt.text(-np.sqrt(3)/2-.14, -.57, '$(1,0,0)$')
plt.text(np.sqrt(3)/2-.1, -.57, '$(0,0,1)$')
plt.text(-.13, 1.01, '$(0,1,0)$')

plt.text(-.06, .5, '$\{2\}$')
plt.text(-np.sqrt(3)/2*(2/3) + np.sqrt(3)/4*(1/3)-.06, VERT, '$\{1\}$')
plt.text(np.sqrt(3)/2*(2/3) - np.sqrt(3)/4*(1/3)-.04, VERT, '$\{3\}$')

plt.xlim([-1,1])
plt.ylim([-.5,1])
plt.gca().spines['top'].set_color('none')
plt.gca().spines['bottom'].set_color('none')
plt.gca().spines['left'].set_color('none')
plt.gca().spines['right'].set_color('none')

plt.xticks([])
plt.yticks([])

plt.savefig('argmax.pdf')

plt.show()


######## Comparing inflated argmax to fixed-margin
from scipy.special import softmax

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

Ks = [3, 10, 25, 50, 75, 100]
eps = .1

N = 1000

fig, axs = plt.subplots(figsize=(7, 4), sharey=True, sharex=True)

s1, s2 = [], []
se1, se2 = [], []
for K in Ks:
    W = softmax(np.random.randn(N, K), axis=1) 
    size1 = [kstar(W[i], eps) for i in range(N)]
    size2 = (W >= np.max(W, 1)[:,np.newaxis] - eps/np.sqrt(2)).sum(1)
    s1.append(np.mean(size1))
    s2.append(np.mean(size2))
    se1.append(np.std(size1)/np.sqrt(N))
    se2.append(np.std(size2)/np.sqrt(N))
s1, s2 = np.array(s1), np.array(s2)
axs.errorbar(Ks, s2, yerr=se2, c=cred, label='Fixed-margin')        
axs.errorbar(Ks, s1, yerr=se1, c=lblue, label='Inflated argmax')
axs.set_xlabel('Number of classes $L$')
axs.set_ylabel('Expected size')

l = axs.legend(bbox_to_anchor=(1.04, 0.5), 
               loc="center left", 
               borderaxespad=0, 
               title='Method')
plt.xticks(Ks)

plt.tight_layout()
plt.savefig('size-comparison.pdf')
plt.show()
