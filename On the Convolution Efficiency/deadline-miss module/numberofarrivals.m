function [nArrivals] = numberofarrivals(i, T, R_i_normal)
% Function numberofarrivals computes the number of arrivals of tasks with higher priority than P_i, under the critical
% instance of tau_i. The number of arrivals is considering arrivals between R_i_normal and D_i
%   Syntax:
%      nArrivals = numberofarrivals(i, T, R_i_normal)
%   Input:
%      i, index of the task under analysis
%      T, Array of minimum inter-arrival times for all tasks in a taskset
%      R_i_normal, The response time of tau_i considering the best case obtainable C_i values of all
%      tasks. Within [0,R_i_normal] the deadline miss probability of tau_i is 1 for
%      each time point.
%   Output:
%      nArrivals, number of higher-priority arrivals from R_i_normal

nArrivals = 0;
for h = 1:i-1
    nArrivals = nArrivals + ceil(T(i)/T(h)) - ceil(R_i_normal/T(h));    % T(i) stands for D(i) since we assume the implicit deadlines
end
end

