clear;
clc;
load fisheriris;
y=species;
c=cvpartition(y,'k',10);