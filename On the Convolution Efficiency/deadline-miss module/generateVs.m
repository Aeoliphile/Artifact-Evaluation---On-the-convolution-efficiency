function [V_hat] = generateVs(C,Q_size)
% Function generateVs computes for each task tau_i the Fourier Transform of vector 
% representing the random variable of its execution times.
%   Syntax:
%      V_hat = generateVs(C)
%   Input:
%      C, The normal WCET
%      Q_size, The desired size of vector V_hat for it to be compliant with element-wise
%      multiplication with Q_hat.
%   Output:
%      V_hat, Fourier transforms of all vectors that represent execution
%      times.
%   Additional info: In this code we hardcoded the generation of random
%   variables as shown in the original experiment by von der Brüggen et al. (ECRTS 2018)

V_hat = cell(1, length(C));

for i = 1:length(C)
    V = zeros(1,Q_size,'mp');  % This line applies the Proposition 12. So it basically accounts that V is computed as X-x1, so [P(C = c_normal), ..., P(C = c_abnormal)]
    V(1) = mp('0.975');
    V(C(i)+1) = mp('0.025');
    V_hat(1,i) = {fft(V)};
end
