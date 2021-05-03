function [hpArrivalsArray] = hparrivals(i, T, R_i_normal)
% Function hpArrivalsArray computes the arrival times of tasks with higher priority than P_i, under the critical
% instance of tau_i. The arrivals are computed between the R_i_lb and D_i
% since at each point in the interval [0, R_i_normal] the deadline miss probability of a task is 1
%   Syntax:
%      hpArrivalsArray = hparrivals(i, T, R_i_normal)
%   Input:
%      i, index of the task under analysis
%      T, Array of minimum inter-arrival times for all tasks in a taskset
%      R_i_normal, The response time of tau_i considering the best case obtainable C_i values of all
%      tasks. Within [0,R_i_normal] the deadline miss probability of tau_i is 1 for
%      each time point.
%   Output:
%      hpArrivalsArray, the array of higher-priority arrivals from R_i_normal
%      to D_i, sorted in an increasing order

arrivals = ones(numberofarrivals(i, T, R_i_normal), 2);    % Initializing array that will store arrivals and index of arriving task

a = 1;
for h = 1:i-1
    for t = ceil(R_i_normal/T(h))*T(h) : +T(h) : floor(T(i)-1/T(h)*T(h))    % T(i)-1 stands for D(i)-1 since we assume implicit deadlines and 
                                                                        %we do not to account for jobs starting at D(i)
        arrivals(a,1) = t;
        arrivals(a,2) = h;
        a = a+1;
    end
end

hpArrivalsArray = sortrows(arrivals);

end

