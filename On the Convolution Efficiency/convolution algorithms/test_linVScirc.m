%%%%%%% TESTING MODULE %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% for linear and circular convolutions %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

test2CaseLinVSCIRC = matlab.unittest.TestCase.forInteractiveUse;

RV = [0.2 0.1 0.3 0.2 0.1 0.1];
 
resultLinear = lconv(RV, 2);
resultCircular = cconv(RV,2);

for i = 1:length(resultLinear)
    assertEqual(test2CaseLinVSCIRC, (resultLinear(i)-resultCircular(i) < mp('1e-34')), true)
    % The above returns true only if for each element of the expected and
    % actual result the relative error is less than 1e-34
end


resultLinear = lconv(RV, 10);
resultCircular = cconv(RV,10);

for i = 1:length(resultLinear)
    assertEqual(test2CaseLinVSCIRC, (resultLinear(i)-resultCircular(i) < mp('1e-34')), true)
    % The above returns true only if for each element of the expected and
    % actual result the relative error is less than 1e-34
end

RV = [0 0 0.2 0 0 0.1 0.3 0.2 0.1 0.1];
 
resultLinear = lconv(RV, 2);
resultCircular = cconv(RV,2);

for i = 1:length(resultLinear)
    assertEqual(test2CaseLinVSCIRC, (resultLinear(i)-resultCircular(i) < mp('1e-34')), true)
    % The above returns true only if for each element of the expected and
    % actual result the relative error is less than 1e-34
end


resultLinear = lconv(RV, 10);
resultCircular = cconv(RV,10);

for i = 1:length(resultLinear)
    assertEqual(test2CaseLinVSCIRC, (resultLinear(i)-resultCircular(i) < mp('1e-34')), true)
    % The above returns true only if for each element of the expected and
    % actual result the relative error is less than 1e-34
end