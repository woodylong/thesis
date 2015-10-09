function yfit = ...
    crossf1(xtrain,ytrain,xtest)
% Train the model on xtrain, ytrain, 
% and get predictions of class of xtest
p = regress(xtrain,ytrain);
yfit =p(1)+p(2)*xtest(:,1)+p(3)*xtest(:,2);
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
end