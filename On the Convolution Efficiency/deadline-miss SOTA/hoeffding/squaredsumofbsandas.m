function [sum_result] = squaredsumofbsandas(k,t,C,T) %#ok<*FNDEF>
%SQUAREDSOMOFBSANDAS Summary of this function goes here
%   Detailed explanation goes here

sum_result = 0;
for i = 1:k
    sum_result = sum_result + (C(i))^2 * ceil(t/T(i));   % Expression bellow Equation 7 in Bruggens paper
end

end

