function [E] = expectationBernstein(i,C)
%EXPECTATION Summary of this function goes here
%   Detailed explanation goes here

    E = mp(C(i)*0.975 + 2*C(i)*0.025);   % Expression bellow Equation 7 in Bruggens paper
end

