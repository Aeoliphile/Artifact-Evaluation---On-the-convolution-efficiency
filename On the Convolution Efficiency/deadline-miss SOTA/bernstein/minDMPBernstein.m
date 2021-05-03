function [minDMP] = minDMPBernstein(k,C,T)
%MINDMPHOEFFDING Summary of this function goes here
%   Detailed explanation goes here

arrivalsToDi = hparrivals(k, T, 0);
minDMP = 1;

% Precomputing variances and K values
K = zeros(1,k);
V = zeros(1,k);
for i = 1:k
    K(i) = computeK(k,C);
    V(i) = var([C(k), 2*C(k)],[0.975, 0.025]);
end





for j = 1:size(arrivalsToDi,1)
    DMP_arrival = probabilityofexceedingBernstein(k,arrivalsToDi(j,1),C,T,V,K);
    minDMP = min(minDMP,DMP_arrival);
end

DMP_arrival = probabilityofexceedingBernstein(k,T(k),C,T,V,K);
minDMP = min(minDMP,DMP_arrival);

end

