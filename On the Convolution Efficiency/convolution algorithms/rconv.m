function [V_hat_sum] = rconv(V_i_hat,r)
% Function rconv is represented by Algorithm 3 in our paper
% IMPORTANT! Prerequisite for the function to work properly is that V_hat
% is of the enough size such that r summations lead to the adequate result,
% same as the linear convolution. This is performed in mindeadlinemiss.m in
% order to optimize code since if we would constantly add zeros here for
% each computation, it would be quite inefficient. The difference from the
% Algorithm 3 in the paper is that we do not consider optimisations
% presented in lines 2 and 3 from the algorithm. These need to be
% implemented for further improvements.
V_hat_sum = ones(1,length(V_i_hat),'mp');
k = 0;
i = 1;
B_n = reverse(dec2bin(r)); % returns binary representation of the integer n                   
while k ~= r
    b = sscanf(B_n(i), '%d');
    if b == 1
        V_hat_sum = V_hat_sum .* V_i_hat;
    end
    V_i_hat = V_i_hat .* V_i_hat;
    k = k + b*2^(i-1);
    i = i + 1;
end
