function [minDMProb] = mindeadlinemiss(i, C, T)
% Function mindeadlinemiss computes the minimum deadline miss probability
% using the circular convolution and Equations 2 and 3 from von der Brüggen et al. paper
% at ECRTS 2018
%   Syntax:
%      minDmpProb = mindeadlinemiss(i, C, T, V)
%   Input:
%      i, index of the task under analysis
%      C, best case obtainable execution time
%      T, Array of minimum inter-arrival times for all tasks in a taskset
%   Output:
%      minDmpProb, a minimum deadline miss probability at any point in the
%      interval [0, D_i]

R_i_normal = rt(i, C, T);

if R_i_normal >= T(i)  % reads like R_i^normal >= D_i, since we assume implicit deadlines D_i = T_i
    minDMProb = 1;     % If R_i_normal is greater than D_i, then for all points DMP is equal to 1
else
    arrivalsAfterR_i_normal = hparrivals(i, T, R_i_normal);
    
    Q_size = sizeofQ(i, C, T);
    V_hat = generateVs(C, Q_size);
    Q_hat = initialQ(i, T, R_i_normal, V_hat, Q_size);
    minDMProb = 1;
    
    for j = 1:size(arrivalsAfterR_i_normal,1)
        
        if R_i_normal >= arrivalsAfterR_i_normal(j,1)
            Q_hat = Q_hat.*V_hat{arrivalsAfterR_i_normal(j,2)};
            R_i_normal = R_i_normal + C(arrivalsAfterR_i_normal(j,2));
        else
            Q = ifft(Q_hat);
            intervalForCheckup = min(arrivalsAfterR_i_normal(j,1) - R_i_normal, length(Q));
            %mp(sum(Q(1:intervalForCheckup)));
            DM_arrival = 1 - mp(sum(Q(1:intervalForCheckup)));
            % The line above computes only until the accuracy of 1.e-34
            % To increase the accuracy, we can compute the probability of
            % non-deadline miss, maximise upon this, and at the end just
            % return 1 - (prob of nondeadline miss)
            minDMProb = min(minDMProb, DM_arrival);
            
            Q_hat = Q_hat.*V_hat{arrivalsAfterR_i_normal(j,2)};
            R_i_normal = R_i_normal + C(arrivalsAfterR_i_normal(j,2));
        end
    end 
    Q = ifft(Q_hat);
    intervalForCheckup = min((T(i) - R_i_normal), length(Q));
    DM_D_i = 1 - mp(sum(Q(1:intervalForCheckup)));
    minDMProb = min(minDMProb, DM_D_i);
end
end

