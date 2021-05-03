testCaseResponseTime = matlab.unittest.TestCase.forInteractiveUse;


% Test taskset
C = [10, 20, 30, 40];
T = [20, 30, 40, 50];

% Test taskset2
C2 = [10, 5, 5, 5];
T2 = [20, 30, 40, 50];

% Test cases

% Test set of higher priority tasks
% function hp(i)
HP4 = hp(4);
assertEqual(testCaseResponseTime,HP4,[1 2 3]);

HP2 = hp(2);
assertEqual(testCaseResponseTime,HP2,[1]);

% Test summation of C_i values for all higher priority tasks

HPsum3 = sum(C(1:3-1));
assertEqual(testCaseResponseTime,HPsum3,30);

HPsum1 = sum(C(1:1-1));
assertEqual(testCaseResponseTime,HPsum1,0);

HPsum2 = sum(C(1:2-1));
assertEqual(testCaseResponseTime,HPsum2,10);

% Test response time sum computation

Rsum_3_30 = rtsum(3,30,C2,T2);
assertEqual(testCaseResponseTime,Rsum_3_30,30);


Rsum_3_20 = rtsum(3,20,C2,T2);
assertEqual(testCaseResponseTime,Rsum_3_20,20);

Rsum_3_21 = rtsum(3,21,C2,T2);
assertEqual(testCaseResponseTime,Rsum_3_21,30);

% Test response time computation

R3 = rt(3,C,T);
assertEqual(testCaseResponseTime,R3,70);

R3_taskset2 = rt(3,C2,T2);
assertEqual(testCaseResponseTime,R3_taskset2,20);




