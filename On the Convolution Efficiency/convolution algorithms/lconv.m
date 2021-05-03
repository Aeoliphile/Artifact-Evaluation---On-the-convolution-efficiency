function [X_n] = lconv(X,n)
% lconv(X,n) computes the linear convolution of vector X, summed up n times
% X is a vector, representing random variable (indexes represent values, 
%   while probabilities are the array elements)
% n is a number of convolutions/summations of X
% ADDITIONAL INFO: Code follows the structure of Algorihtm 3 in our paper,
% but uses the built-in Matlab linear convolution (conv) instead of the
% circular convolution. Also, it uses the power additions, instead of power
% multiplications. Very similar concept was proposed in the paper by
% Milutinovic et al. (ARCS 2015).
X = mp(X);
V_prim = X;		   % Fast Fourier transform
V_sum = [1];    % Vector of values equal to 1
k = 0;
i = 1;
B_n = reverse(dec2bin(n)); % returns binary representation of the integer n                   
while k ~= n
    b = sscanf(B_n(i), '%d');
    if b == 1
        V_sum = conv(V_sum, V_prim);
    end
    V_prim = conv(V_prim, V_prim);
    k = k + b*2^(i-1);
    i = i + 1;
end
X_n = V_sum;