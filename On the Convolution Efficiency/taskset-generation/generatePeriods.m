function [sortedperiods] = generatePeriods(n)
% n is a number of tasks
% This function generates periods in range 10 ms to 1000 ms according to a
% log uniform distribution
LA = log(10); LB = log(1000);
periods = exp(LA + (LB-LA) * rand(1,n));
sortedperiods = sort(periods);