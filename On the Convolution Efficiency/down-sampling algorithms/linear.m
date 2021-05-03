function X_prim = linear(X,s)
% Function linear performs the linear down-sampling as described in
% Algorithm 2 from our paper.
%
%   Syntax:
%      X_prim = linear(X,s)
%   Input:
%      X, random variable represented as the two-row matrix, where the
%      first row represents values of X, and the second row represents the
%      probabilities for the respective values.
%      s, size of the image of the random variable after down-sampling.
%   Output:
%      X_prim, down-sampled random variable.
n = length(X);
P_un = 1;
p_delta = P_un/s;
ImX_prim = zeros(1,s);
insertTo = 1;
p = 0;
for l = 1:n
    p = p +  X(2,l);
    P_un = P_un -  X(2,l);
    if l == n || p >= p_delta
        ImX_prim(insertTo) = l;
        insertTo = insertTo + 1;
        s = s - 1;
        p_delta = P_un/s;
        p = 0;
    end
end

X_prim = resample(X, ImX_prim);

