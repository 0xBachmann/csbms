#! /usr/bin/env python

#import packages
import sys
import numpy as np
import scipy.interpolate as ip
import scipy.integrate as ig
import matplotlib.pyplot as plt

#trapezoid function
def trapezoid(y, x, cumsum=[]):
    integral = 0.0
    cumsum.append(integral)
    for i in range(len(y)-1):
        inc = (y[i]+y[i+1])*(x[i+1]-x[i])/2.0
        integral += inc
        cumsum.append(integral)
    return integral

#read in data 
data = np.loadtxt("ave_dhdl.dat")

#integrate data
s = []
integral1 =  trapezoid(data[:,1], data[:,0], cumsum=s)
error1 = trapezoid(data[:,2], data[:,0])

#cubic spline fit to data
f = ip.interp1d(data[:,0], data[:,1], kind='cubic')

#evaluate spline fit on 100 equispaced points between 0 and 1
xnew = np.linspace(0,1,100)
ynew = f(xnew)

#integrate fit
s2 = []
integral2 =  trapezoid(ynew, xnew, cumsum=s2)

#plot data
fig = plt.figure()
ax  = plt.subplot(111)
ax.errorbar(data[:,0], data[:,1], yerr=data[:,2], label='simulated')
ax.plot(data[:,0], s, label='int simulated')
#plot spline
ax.plot(xnew, ynew, label='cubic spline fit')
ax.plot(xnew, s2, label='int spline fit')
#title, labels and legend
plt.title(str(sys.argv[2]).replace("_", " "))
plt.xlabel("$\lambda$")
plt.ylabel(r'$\langle \partial H / \partial \lambda \rangle_{\lambda}$')
#change default order of labels
handles, labels = ax.get_legend_handles_labels()
ax.legend(handles=[handles[3]]+handles[:3],loc="best")

#save figure
plt.savefig(str(sys.argv[1]))

#print integration results
print("# integrated(python) " + str(integral1) + ' $\pm$ ' + str(error1))
print("# integrated after cubic spline fitting(python) " + str(integral2))

