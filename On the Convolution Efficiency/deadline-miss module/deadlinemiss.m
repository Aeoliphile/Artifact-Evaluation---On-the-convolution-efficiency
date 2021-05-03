function [deadlineMissP] = deadlinemiss(i,C,T,V)
%DEADLINEMISS Function for computing the deadline miss probability
%until the given time point t
%   Syntax:
%      deadlineMissP = deadlinemiss(i, C, T, V)
%   Input:
%      i, index of the task under analysis
%      C, best case obtainable execution time
%      T, Array of minimum inter-arrival times for all tasks in a taskset
%      V, Vector representing the random variable of execution times of all
%      tasks in a tasket. However, V_k = [P(C_k = C_k^normal), ... ,
%      P(C_k = C_k^abnormal)]. Indexes go from 0 to C_k^abnormal -
%      C_k^normal, which is the optimisation from our paper (Proposition 12)
%   Output:
%      minDmpProb, a minimum deadline miss probability at any point in the
%      interval [0, D_i]

R_i_normal = rt(i, C, T);

if R_i_normal >= T(i)  % reads like R_i^normal >= D_i, since we assume implicit deadlines D_i = T_i
    minDmpProb = 1;     % If R_i_normal is greater than D_i, then for all points DMP is equal to 1
else
    arrivalsAfterR_i_normal = hparrivals(i, T, R_i_normal);
    Q_size = sizeofQ(i, C, T);
    
    V_hat = generateVs(C, Q_size);
    Q_hat = initialQ(i, T, R_i_normal, V_hat, Q_size);
    
end
ones(1,100,'mp')



end

end

