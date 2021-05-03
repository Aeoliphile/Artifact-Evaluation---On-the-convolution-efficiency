function [DMP_t] = probabilityofexceedingHoeffding(k,t,C,T)
%PROBABILITYOFEXCEEDING is a function from Equation 7 in paper by Bruggen
%et al. from ECRTS 2018
%   Detailed explanation goes here


expectationS_t = expectation(k,t,C,T);

%upper case of conditional equation
sum_of_bs_and_as = squaredsumofbsandas(k,t,C,T);
exp_term = exp(- (2*(t - expectationS_t)^2)/ sum_of_bs_and_as);

if (t - expectationS_t) > 0
    DMP_t = exp_term;
else
    DMP_t = 1;
end

