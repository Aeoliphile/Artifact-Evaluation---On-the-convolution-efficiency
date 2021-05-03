function [nQ] = sizeofQ(i, C, T)
% Function sizeofQ computes the size of vector Q that represents the
% probability distribution of summation of random variables, i.e.
% probabilistic response time. It is computed considering Proposition 11
% from our paper and it considers that C_i_abnormal = 2*C_i_normal from
% von der Brüggen et al. paper at ECRTS 2018 et al. in ECRTS 2018.
%   Syntax:
%      nQ = sizeofQ(i, C, T)
%   Input:
%      i, index of the task under analysis
%      C, array of NORMAL WCET values
%      T, Array of minimum inter-arrival times
%   Output:
%      nQ, size of Q such that linear convolution is equal to the circular

nQ = 0;
for h = 1:i-1
    nQ = nQ + C(h)*ceil((T(i)-1)/T(h));    % T(i) stands for D(i) since we assume the implicit deadlines 
                                                                 % while C(i) represents the length of the random variable
end
nQ = pow2(nextpow2(nQ + C(i))) ; % Same as C_i^abnormal - C_i^normal, pow2(nextpow2... makes the size optimal for fft and ifft
end


