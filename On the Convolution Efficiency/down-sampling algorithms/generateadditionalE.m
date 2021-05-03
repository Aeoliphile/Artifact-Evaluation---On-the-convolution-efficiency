function [matrixOfExpectations] = generateadditionalE(X)
% Function generateadditionalE computes the expected values for each pair
% of values with non-zero probability form the random variable X. This is
% performed using Equation 3 from our paper but for any values (i,j) where
% i <= j.
%
%   Syntax:
%      matrixOfExpectations = generateadditionalE(X)
%   Input:
%      X, random variable represented as the two-row matrix, where the
%      first row represents values of X, and the second row represents the
%      probabilities for the respective values.
%   Output:
%      matrixOfExpectations, matrix representing the additional expectation
%      between each pair of values in X.

n = length(X);
matrixOfExpectations = zeros(length(X),length(X));

for i = 1:n
    for j = i:n
        matrixOfExpectations(i,j) = additionalexpectation(i,j,X);
    end
end