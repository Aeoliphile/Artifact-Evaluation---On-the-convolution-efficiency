function [DMP_t] = probabilityofexceedingBernstein(k,t,C,T,V,K)
%PROBABILITYOFEXCEEDING is a function from Equation 7 in paper by Bruggen
%et al. from ECRTS 2018
%   Detailed explanation goes here


expectationS_t = expectation(k,t,C,T);

%upper case of conditional equation
lower_sum = sumofvarianceandk(k,t,C,T,V,K);
exp_term = exp(- ((((t - expectationS_t)^2)/2) / lower_sum));

if (t - expectationS_t) > 0
    DMP_t = exp_term;
else
    DMP_t = 1;
end

