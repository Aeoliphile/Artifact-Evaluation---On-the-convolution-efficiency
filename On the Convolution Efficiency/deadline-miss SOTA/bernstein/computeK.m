function [K] = computeK(k,C)
%COMPUTE_K Summary of this function goes here
%   Detailed explanation goes here

K = 0;
for i = 1:k
    currentMax = 2*C(i) - expectationBernstein(i,C);
    K = max(K,currentMax);   % Expression bellow Equation 7 in Bruggens paper
end

end

