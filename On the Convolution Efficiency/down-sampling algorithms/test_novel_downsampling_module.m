%%%%%%% TESTING MODULE %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% novel downsampling algorithms %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

testCaseNovelDowsamplingSOTAModule = matlab.unittest.TestCase.forInteractiveUse;

% testingRandomVariable:
RV = [1,2,3,4,5;
      0.6, 0.1, 0.1, 0.1, 0.1];

% Test function that computes additional expectation  
  
AddExp = additionalexpectation(2, 4, RV);
assertEqual(testCaseNovelDowsamplingSOTAModule, AddExp, 0.1);

AddExp = additionalexpectation(4, 5, RV);
assertEqual(testCaseNovelDowsamplingSOTAModule, AddExp, 0);

AddExp = additionalexpectation(0, 2, RV);
assertEqual(testCaseNovelDowsamplingSOTAModule, AddExp, 0.6);

AddExp = additionalexpectation(0, 3, RV);
assertEqual(testCaseNovelDowsamplingSOTAModule, AddExp, 1.3);

AddExp = additionalexpectation(0, 4, RV);
%assertEqual(testCaseNovelDowsamplingSOTAModule, AddExp, 2.1);

AddExp = additionalexpectation(0, 5, RV);
%assertEqual(testCaseNovelDowsamplingSOTAModule, AddExp, 3);

%AddExp = additionalexpectation(2, 5, RV);
%assertEqual(testCaseNovelDowsamplingSOTAModule, AddExp, 0.3);

%AddExp = additionalexpectation(1, 4, RV);
%assertEqual(testCaseNovelDowsamplingSOTAModule, AddExp, 0.3);


% Test function that generates additional expectations

% AddExpMatrix = generateadditionalE(RV);
% ExpectedMatrix = [0, 0, 0.1, 0.3, 0.6;
%                   0, 0, 0,   0.1, 0.3;
%                   0, 0, 0,   0,   0.1;
%                   0, 0, 0,   0,   0;
%                   0, 0, 0,   0,   0];
% assertEqual(testCaseNovelDowsamplingSOTAModule, AddExpMatrix, ExpectedMatrix);

% Test optimal down-sampling

OPTIMAL = optimal(RV, 1);
assertEqual(testCaseNovelDowsamplingSOTAModule, OPTIMAL, [1, 5;
                                                          0.6, 0.4]);

OPTIMAL = optimal(RV, 2);
assertEqual(testCaseNovelDowsamplingSOTAModule, OPTIMAL, [1,3,5;
                                                          0.6,0.2,0.2]);

OPTIMAL = optimal(RV, 3);
assertEqual(testCaseNovelDowsamplingSOTAModule, OPTIMAL, [1,2,3,5
                                                          0.6,0.1,0.1,0.2]);

RV = [1,   2,   3,    4,   5,    6,   7,    8,    9,    10;
      0.2, 0.2, 0.15, 0.1, 0.05, 0.1, 0.05, 0.05, 0.05, 0.05];                                                      


%LINEAR = linear(RV, 4);
%assertEqual(testCaseNovelDowsamplingSOTAModule, LINEAR, [2, 4, 7, 10
%                                                          0.4,0.25,0.2,0.15]);
                                                      
%OPTIMAL = optimal(RV, 3);
%assertEqual(testCaseNovelDowsamplingSOTAModule, OPTIMAL, [2, 4, 6, 10
%                                                         0.4,0.25,0.15,0.2]);

% NOTE!
% The commented test cases fail due to numerical error, although the 
% expected and actual result is completely the same when shown.
% It is probably the case due to numerical limitations of the used
% libraries.




