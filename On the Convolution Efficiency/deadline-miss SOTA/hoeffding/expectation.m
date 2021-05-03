function [expS_t] = expectation(k,t,C,T)
%EXPECTATION Summary of this function goes here
%   Detailed explanation goes here

expS_t = 0;
for i = 1:k
    expS_t = expS_t + mp(C(i)*0.975 + 2*C(i)*0.025) * ceil(t/T(i));   % Expression bellow Equation 7 in Bruggens paper
end
end
