function prob = exceedenceprob(X, x)
%EXCEEDENCEPROB Summary of this function goes here
%   Detailed explanation goes here

prob = 0;
for i = 1:length(X)
    if(X(1,i)>= x)
        prob = prob + X(2,i);
    end
end


end

