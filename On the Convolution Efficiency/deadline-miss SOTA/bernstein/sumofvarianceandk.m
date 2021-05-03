function [sum_result] = sumofvarianceandk(k,t,C,T,V,K) %#ok<*FNDEF>
%SQUAREDSOMOFBSANDAS Summary of this function goes here
%   Detailed explanation goes here

sum_result = 0;

E_S_t = expectation(k,t,C,T);

for i = 1:k
    sum_result = sum_result + V(i) * ceil(t/T(i)) + K(i) * (t - E_S_t)/3;   % Expression bellow Equation 7 in Bruggens paper
end

end

