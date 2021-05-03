function [R] = rtsum(i,t,C,T)
% Function rtsum(i,t,C,T) computes the NORMAL WCET workload for the i-th task, given the
% duration 't', array 'C' of NORMAL WCETs values, and array 'T' of periods
%   Syntax:
%      R = Rsum(i,t,C,T)
%   Input:
%      i, index of the task under analysis
%      t, time duration under analysis
%      C, array of NORMAL WCET values
%      T, Array of minimum inter-arrival times
%   Output:
%      R, response time sum 
sum = C(i);
for h = 1:i-1
    sum = sum + ceil(t/T(h)) * C(h);
end
R = sum;

