function [Q_hat] = initialQ(i, T, R_i_normal, V_hat, Q_size)
% Function initialQ computes the random variable in the form of the Fourier
% transform Q, considering the probabilistic workload initiated by arrivals
% within the interval [0 to R_i_normal]
%
%   Syntax:
%      Q_hat = initialQ(i, C, T, V, R_i_normal)
%   Input:
%      i, index of the task under analysis
%      T, Array of minimum inter-arrival times for all tasks in a taskset
%      R_i_normal, the worst-case response time of tau_i considering
%      V_hat, fourier transform of the random variables representing
%      execution times
%      Q_size, the necessary size of the Fourier vector such that linear
%      and circular convolution are identical.
%   Output:
%      Q_hat, cumulative execution distribution, considering the workload
%      until R_i_normal.


Q_hat = ones(1, Q_size, 'mp');

for h = 1:i
    alpha_h = ceil(R_i_normal/T(h));
    Q_hat = Q_hat .* rconv(V_hat{h}, alpha_h);
end

