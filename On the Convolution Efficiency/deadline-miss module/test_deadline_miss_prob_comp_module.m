%%%%%%% TESTING MODULE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% for deadline miss prob. and corresponding computations %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

testCaseDeadlineMissModule = matlab.unittest.TestCase.forInteractiveUse;


% Test data 1
T = [20, 30, 40, 50];
C = [10, 5, 8, 7];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test the function that computes the number of HP arrivals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numberOfArrivalsTD1_3 = numberofarrivals(3, T, 0);    % Number of arrivals of HP tasks of tau_3, from 0 to 30 = D_3
assertEqual(testCaseDeadlineMissModule, numberOfArrivalsTD1_3, 4);

numberOfArrivalsTD1_4 = numberofarrivals(4, T, 0);    % Number of arrivals of HP tasks of tau_3, from 0 to 30 = D_3
assertEqual(testCaseDeadlineMissModule, numberOfArrivalsTD1_4, 7);

numberOfArrivals_R_greaterThan_D = numberofarrivals(4, T, 100);    % Number of arrivals of HP tasks of tau_3, from 0 to 30 = D_3
assertEqual(testCaseDeadlineMissModule, numberOfArrivals_R_greaterThan_D, -5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test the function that computes the HP arrivals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
arrivals_3 = hparrivals(3,T,0);
assertEqual(testCaseDeadlineMissModule, arrivals_3, [0, 1;
                                                     0, 2;
                                                     20, 1;
                                                     30, 2]);
                                                 
arrivals_4 = hparrivals(4,T,0);
assertEqual(testCaseDeadlineMissModule, arrivals_4, [0, 1;
                                                     0, 2;
                                                     0, 3;
                                                     20, 1;
                                                     30, 2;
                                                     40, 1;
                                                     40, 3]);
                                                 
arrivals_none = hparrivals(4,T,40);
assertEqual(testCaseDeadlineMissModule, arrivals_none, [40, 1;
                                                        40, 3]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test the function that computes the size of vector Q that allows for
% equality between linear and circular convolution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
size_Q_for_2 = sizeofQ(2, C, T);
assertEqual(testCaseDeadlineMissModule, size_Q_for_2, 32);  % The result considering cummulative job range is 25, but with optimization for fft it is 32

size_Q_for_3 = sizeofQ(3, C, T);
assertEqual(testCaseDeadlineMissModule, size_Q_for_3, 64);  

size_Q_for_4 = sizeofQ(4, C, T);
assertEqual(testCaseDeadlineMissModule, size_Q_for_4, 64);  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test the function for generating Fourier Transform of task vectors, i.e. random variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vectors = generateVs([3,4],6);
assertEqual(testCaseDeadlineMissModule, vectors{1,1}, fft(mp('[0.975, 0, 0, 0.025, 0, 0]')));
assertEqual(testCaseDeadlineMissModule, vectors{1,2}, fft(mp('[0.975, 0, 0, 0, 0.025, 0]'))); 

vectorsC = generateVs(C, 12);
assertEqual(testCaseDeadlineMissModule, vectorsC{1,1}, fft(mp('[0.975, 0,0,0,0,0,0,0,0,0, 0.025, 0]')));
assertEqual(testCaseDeadlineMissModule, vectorsC{1,2}, fft(mp('[0.975, 0,0,0,0, 0.025, 0, 0, 0, 0, 0, 0]'))); 
assertEqual(testCaseDeadlineMissModule, vectorsC{1,3}, fft(mp('[0.975, 0,0,0,0,0,0,0, 0.025, 0, 0, 0]'))); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reverse FFT test, i.e. Test of FFT and IFFT precision.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mp.Digits(34);
assertEqual(testCaseDeadlineMissModule, mp.Digits, 34);

ActualVectorsInversed = real(ifft(vectorsC{1,3}));
ExpectedVectorsInversed = mp('[0.975, 0,0,0,0,0,0,0, 0.025, 0, 0, 0, 0]');
for i = 1:12
    assertEqual(testCaseDeadlineMissModule, (ActualVectorsInversed(i)-ExpectedVectorsInversed(i) < mp('1e-34')), true)
    % The above returns true only if for each element of the expected and
    % actual result the relative error is less than 1e-34
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testing rconv function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V_hat = fft(mp('[0.8,0,0.2,0,0,0]'));
Q_hat = rconv(V_hat, 2);
ExpectedVector = mp('[0.64,0,0.32,0,0.04,0]');
ActualVector = ifft(Q_hat);
for i = 1:length(Q_hat)
    assertEqual(testCaseDeadlineMissModule, (ActualVector(i)-ExpectedVector(i) < mp('1e-34')), true)
    % The above returns true only if for each element of the expected and
    % actual result the relative error is less than 1e-34
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testing initialQ function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = [20, 30, 40, 50];
C = [10, 10, 4, 5];
Q_size = sizeofQ(2, C, T);
V_hat = generateVs(C,Q_size);

R_2_normal = rt(2,C,T); % equal to 5 at the moment
init_Q_2 = initialQ(2, T, R_2_normal, V_hat, Q_size);

ExpectedVector = conv(mp('[0.975,0,0,0,0,0,0,0,0,0,0.025]'),mp('[0.975,0,0,0,0,0,0,0,0,0,0.025]'));
ActualVector = ifft(init_Q_2);
for i = 1:19
    assertEqual(testCaseDeadlineMissModule, (ActualVector(i)-ExpectedVector(i) < mp('1e-34')), true)
    % The above returns true only if for each element of the expected and
    % actual result the relative error is less than 1e-34
end

Q_size = sizeofQ(3, C, T);
V_hat = generateVs(C,Q_size);

R_3_normal = rt(3,C,T); % equal to 44 at the moment
init_Q_3 = initialQ(3, T, R_3_normal, V_hat, Q_size);

tau_1_vec = conv(mp('[0.975,0,0,0,0,0,0,0,0,0,0.025]'),mp('[0.975,0,0,0,0,0,0,0,0,0,0.025]'));
tau_1_vec = conv(tau_1_vec, mp('[0.975,0,0,0,0,0,0,0,0,0,0.025]'));
tau_2_vec = conv(mp('[0.975,0,0,0,0,0,0,0,0,0,0.025]'),mp('[0.975,0,0,0,0,0,0,0,0,0,0.025]'));
tau_1_and_2_vec = conv(tau_1_vec,tau_2_vec);
tau_3 = conv(mp('[0.975,0,0,0,0.025]'),mp('[0.975,0,0,0,0.025]'));
ExpectedVector = conv(tau_1_and_2_vec,tau_3);
ActualVector = ifft(init_Q_3);
for i = 1:34
    assertEqual(testCaseDeadlineMissModule, (ActualVector(i)-ExpectedVector(i) < mp('1e-34')), true)
    % The above returns true only if for each element of the expected and
    % actual result the relative error is less than 1e-34
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testing mindeadlinemiss function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C = [5, 5, 3, 8];
T = [20, 20, 35, 40];

RT = rt(4,C,T);
arrivalsAfterR_i_normal = hparrivals(4, T, RT);

minDMP = mindeadlinemiss(4, C, T);

RV_1_times_2 = conv(mp('[0,0,0,0,0,0.975,0,0,0,0,0.025]'),mp('[0,0,0,0,0,0.975,0,0,0,0,0.025]'));
RV_2_times_2 = RV_1_times_2;
RV_3_times_1 = mp('[0,0,0,0.975,0,0,0.025]');
RV_3_times_2 = conv(RV_3_times_1,RV_3_times_1);
RV_4_times_1 = mp('[0,0,0,0,0,0,0,0,0.975,0,0,0,0,0,0,0,0.025]');

sum_until_35 = conv(RV_1_times_2,RV_2_times_2);
sum_until_35 = conv(sum_until_35,RV_3_times_1);
sum_until_35 = conv(sum_until_35,RV_4_times_1);

DMP_until_35_time_unit = 1-sum(sum_until_35(1:35));

sum_until_40 = conv(sum_until_35, RV_3_times_1);
Expected_MIN_DeadlineMiss = 1-sum(sum_until_40(1:40));   
assertEqual(testCaseDeadlineMissModule, round(minDMP,30), round(Expected_MIN_DeadlineMiss,30));


                                                 