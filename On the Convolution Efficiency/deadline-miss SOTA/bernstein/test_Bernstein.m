testCaseBernsteinModule = matlab.unittest.TestCase.forInteractiveUse;

% Test cases for Hoeffding and related functions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test expectationBernstein function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C = [5, 5, 3, 8];
T = [20, 20, 35, 40];

actualExpectation = expectationBernstein(4,C);
assertEqual(testCaseBernsteinModule, round(actualExpectation,1), round(mp('8.2'),1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test sumofvarianceandk function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

actualResult = sumofvarianceandk(4,20,C,T);
assertEqual(testCaseBernsteinModule, round(actualResult,1), round(mp('-5.2'),1));

actualResult = sumofvarianceandk(4,100,C,T);
assertEqual(testCaseBernsteinModule, round(actualResult,1), round(mp('136.5'),1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test probabilityofexceedingBernstein function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

actualProb = probabilityofexceedingBernstein(4,35,C,T);
assertEqual(testCaseBernsteinModule, round(actualProb,4), round(mp('0.8561'),4));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test minDMPBernstein function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

actualDMP = minDMPBernstein(4,C,T);
assertEqual(testCaseBernsteinModule, round(actualDMP,4), round(mp('0.7646'),4));




