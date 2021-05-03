function [Ri] = rt(i,C,T)
% Function rt(i,C,T) computes response time of the i-th task in the taskset
% given the index of the task, array of NORMAL WCET values and array of periods.
% It stops immediately if R_i is greater than D_i, and returns R_i.
%   Syntax:
%      Ri = rt(i,C,T)
%   Input:
%      i, index of the task under analysis
%      C, array of NORMAL WCET values
%      T, Array of minimum inter-arrival times
%   Output:
%      Ri, response time of tau_i

Ri = C(i);
R_i_next = rtsum(i,Ri,C,T);

while(Ri ~= R_i_next && Ri < T(i) )
    Ri = R_i_next;
    R_i_next = rtsum(i,Ri,C,T);
end



