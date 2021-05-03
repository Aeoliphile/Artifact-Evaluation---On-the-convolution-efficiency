testCaseHoeffdingModule = matlab.unittest.TestCase.forInteractiveUse;

% Test cases for Hoeffding and related functions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test expectation function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C = [5, 5, 3, 8];
T = [20, 20, 35, 40];

actualExpectation = expectation(4,20,C,T);
assertEqual(testCaseHoeffdingModule, (actualExpectation-21.525 < mp('1e-8')), true)

actualExpectation = expectation(4,35,C,T);
assertEqual(testCaseHoeffdingModule, (actualExpectation-31.775 < mp('1e-8')), true)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test squaredsumofbsandas function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

actualResult = squaredsumofbsandas(4,20,C,T);
assertEqual(testCaseHoeffdingModule, actualResult, 123);

actualResult = squaredsumofbsandas(4,100,C,T);
assertEqual(testCaseHoeffdingModule, actualResult, 469);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test probabilityofexceeding function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

actualProb = probabilityofexceedingHoeffding(4,35,C,T);
assertEqual(testCaseHoeffdingModule, (actualProb-0.88670 < mp('1e-4')), true)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test probabilityofexceeding function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

actualDMP = minDMPhoeffding(4,C,T);
assertEqual(testCaseHoeffdingModule, (actualDMP-0.74717 < mp('1e-4')), true)




