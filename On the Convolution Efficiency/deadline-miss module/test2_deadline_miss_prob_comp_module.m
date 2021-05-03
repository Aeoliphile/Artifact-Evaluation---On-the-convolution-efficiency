%%%%%%% TESTING MODULE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% for deadline miss prob. and corresponding computations %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

test2CaseDeadlineMissModule = matlab.unittest.TestCase.forInteractiveUse;


% Test data 1
T = [8,8];
C = [2,1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test the function that computes the number of HP arrivals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numberOfArrivalsTD1_3 = numberofarrivals(2, T, 0);    % Number of arrivals of HP tasks of tau_3, from 0 to 30 = D_3
assertEqual(test2CaseDeadlineMissModule, numberOfArrivalsTD1_3, 1);

numberOfArrivals_R_greaterThan_D = numberofarrivals(2, T, 10);    % Number of arrivals of HP tasks of tau_3, from 0 to 30 = D_3
assertEqual(test2CaseDeadlineMissModule, numberOfArrivals_R_greaterThan_D, -1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test the function that computes the HP arrivals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
arrivals_3 = hparrivals(2,T,0);
assertEqual(test2CaseDeadlineMissModule, arrivals_3, [0, 1]);
                                                 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test the function that computes the size of vector Q that allows for
% equality between linear and circular convolution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
size_Q_for_2 = sizeofQ(2, C, T);
assertEqual(test2CaseDeadlineMissModule, size_Q_for_2, 4);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test the function for generating Fourier Transform of task vectors, i.e. random variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vectorsC = generateVs(C, 4);
assertEqual(test2CaseDeadlineMissModule, vectorsC{1,1}, fft(mp('[0.975, 0, 0.025, 0]')));
assertEqual(test2CaseDeadlineMissModule, vectorsC{1,2}, fft(mp('[0.975, 0.025, 0, 0]')));  



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testing rconv function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V_hat = fft(mp('[0.8,0,0.2,0,0,0]'));
Q_hat = rconv(V_hat, 2);
ExpectedVector = mp('[0.64,0,0.32,0,0.04,0]');
ActualVector = ifft(Q_hat);
for i = 1:length(Q_hat)
    assertEqual(test2CaseDeadlineMissModule, (ActualVector(i)-ExpectedVector(i) < mp('1e-34')), true)
    % The above returns true only if for each element of the expected and
    % actual result the relative error is less than 1e-34
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testing initialQ function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q_size = sizeofQ(2, C, T);
V_hat = generateVs(C,Q_size);

R_2_normal = rt(2,C,T); % equal to 5 at the moment
init_Q_2 = initialQ(2, T, R_2_normal, V_hat, Q_size);

ExpectedVector = conv(mp('[0, 0, 0.975,0,0.025]'),mp('[0, 0.975,0.025,0,0]'));
ActualVector = ifft(init_Q_2);
for i = 1:4
    assertEqual(test2CaseDeadlineMissModule, (ActualVector(i)-ExpectedVector(i+3) < mp('1e-33')), true)
    % The above returns true only if for each element of the expected and
    % actual result the relative error is less than 1e-34
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testing mindeadlinemiss function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

RT = rt(2,C,T);
arrivalsAfterR_i_normal = hparrivals(2, T, RT);

minDMP = mindeadlinemiss(2, C, T);

RV_1_times_RV_2 = conv(mp('[0, 0, 0.975,0,0.025]'),mp('[0, 0.975,0.025,0,0]'));
sum_until_8 = RV_1_times_RV_2;
DMP_until_8_time_unit = 1-sum(sum_until_8(1:8));

assertEqual(test2CaseDeadlineMissModule, minDMP, DMP_until_8_time_unit);



                                                 