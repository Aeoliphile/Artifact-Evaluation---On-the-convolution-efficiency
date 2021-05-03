function X_prim = optimal(X,s)
% Function optimal performs the optimal down-sampling as described in
% Algorithm 1 from our paper.
%
%   Syntax:
%      X_prim = optimal(X,s)
%   Input:
%      X, random variable represented as the two-row matrix, where the
%      first row represents values of X, and the second row represents the
%      probabilities for the respective values.
%      s, size of the image of the random variable after down-sampling.
%   Output:
%      X_prim, down-sampled random variable.

n = length(X);

AE = generateadditionalE(X);
alpha = X(1)-1;

E = zeros(1,n);
for l = 1:n
    E(l) = additionalexpectation(alpha,l,X);
end

V = cell(1,n);
%ImX_prim(insertTo) = l;
%insertTo = insertTo + 1;

for i = 1:s
   E_prim = Inf * ones(1,n);
   V_prim = cell(1,n);
   for k = 1:n
       for l = k+1:n
           if E_prim(l) > E(k) + AE(k,l)
               E_prim(l) = E(k) + AE(k,l);
               
               
               V_k_union_k = V{k};
               V_k_union_k(length(V_k_union_k)+1) = k;
               V_prim{l} = V_k_union_k;
           end
       end
   end
   for l = 1:n
       E(l) = E_prim(l);
       V{l} = V_prim{l};
   end
end
Vn = V{n};
Vn(s+1) = n;
X_prim = resample(X, Vn);
%En = E(n)

