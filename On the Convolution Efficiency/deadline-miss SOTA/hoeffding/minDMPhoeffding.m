function [minDMP] = minDMPhoeffding(k,C,T)
%MINDMPHOEFFDING Summary of this function goes here
%   Detailed explanation goes here

arrivalsToDi = hparrivals(k, T, 0);
minDMP = 1;

for j = 1:size(arrivalsToDi,1)
    DMP_arrival = probabilityofexceedingHoeffding(k,arrivalsToDi(j,1),C,T);
    minDMP = min(minDMP,DMP_arrival);
end

DMP_arrival = probabilityofexceedingHoeffding(k,T(k),C,T);
minDMP = min(minDMP,DMP_arrival);

end

