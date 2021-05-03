function [WCETs] = generateWCETs(Utilisations, Periods)
% This function generates the worst-case execution time values according to
% the given utilisations and periods
WCETs = Utilisations .* Periods;