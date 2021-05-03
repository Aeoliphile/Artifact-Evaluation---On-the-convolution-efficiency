function [hp_i] = hp(i)
% hp(i) computes the indexes of tasks with priority higher than P_i
% Input: index i
hp_i = 1:i-1;

