function [AbWCETs] = generateAbnormalWCETs(WCETs)
% n is a number of tasks
% This function generates periods in range 10 ms to 1000 ms according to a
% log uniform distribution
AbWCETs = 2 * WCETs;