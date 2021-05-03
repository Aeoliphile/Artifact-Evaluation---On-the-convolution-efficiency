function [X_n] = cconv(X,n)
% cconv(X,n) computes the circular convolution of vector X, summed up n times
% X is a vector, representing random variable (indexes represent values, 
%   while probabilities are the array elements)
% n is a number of convolutions/summations of X
%
% ADDITIONAL INFO: Code follows the structure of Algorihtm 3 in our paper,
% but does not include Improvements 1 and 2 from the paper. The
% improvements must be implemented on top of this code structure. Also, the
% code is based on the fast circular convolution, contributed by Stephen
% McGovern, available at:
% https://www.mathworks.com/matlabcentral/fileexchange/5110-fast-convolution
X = mp(X);
Ly = n*length(X); %-1;
Ly2 = pow2(nextpow2(Ly));    % Find smallest power of 2 that is > Ly
V_prim = fft(X, Ly2);		   % Fast Fourier transform
V_sum = ones(1,Ly2,'mp');    % Vector of values equal to 1
k = 0;
i = 1;
B_n = reverse(dec2bin(n)); % returns binary representation of the integer n                   
while k ~= n
    b = sscanf(B_n(i), '%d');
    if b == 1
        V_sum = V_sum .* V_prim;
    end
    V_prim = V_prim .* V_prim;
    k = k + b*2^(i-1);
    i = i + 1;
end
X_n = abs(real(ifft(V_sum)));
