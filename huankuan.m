function [k, x]= huankuan( a,y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x(1)=a;
for n=1:1:60
x(n+1)=y*x(n)/12-500+x(n);
if x(n+1)<=0
    k=n+1;
    break;
end
end

