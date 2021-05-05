% This script computes the experiments presented under Section 5.3 of our
% paper. Two figures, corresponding to Figures, 6(a) and 6(b), from the 
% paper, are generated when running this script.


disp('Experiment started. Wait for the confirmation about its finalisation.')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Experiment represented in Figures 6(a) and 6(b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


MU = 20; % Base metrics unit of time. 1 means that milisecond is the base.
         % General formula, Base metrics in miliseconds is equal to 1/MU ms
         % Default base unit is 50 microseconds.


avgTimes = zeros(3,7); % collection for the average execution times for each method
avgDMPs = zeros(3,7); % collection for the average deadline miss probabilities

%%%%%% IMPORTANT %%%%%%
NoOfRuns = 25; 
% NoOfRuns = 1000; % Number of runs for the original experiment
% If on your machine it takes too long to perform this script, reduce the above number
% It represents a number of runs per each point in the graph.
% Reducing this number increases the standard deviation of the results.
% Increasing this number reduces the standard deviation of the results.


for ordinal = 1:7
    n = ordinal * 5; % Number of tasks in a tasket. Ranges from 1*5 = 5 to 7*5 = 35, by 5
    Utot = 0.7; % Total taskset utilisation, i.e. sum of all the task utilisations in a taskset.
    durations = zeros(NoOfRuns,3); % Collection of execution times for each method.
    DMprobs = zeros(NoOfRuns,3);   % Collection of deadline miss probabilities for each method.
    for k = 1:length(durations)
        U = UUniFast(n,Utot);      % Generation of the ndividual task utilisations, represented in the array.
        T = generatePeriods(n);    % Generation of the individual periods, represented in the array.
        C = ceil(MU * generateWCETs(U, T)); % Computation of the WCET values and scaling to fit the base unit.
        T = ceil(T)*MU;            % Periods represented in the base time metrics.
        
        
        tic
        DMprobs(k,2) = minDMPBernstein(n,C,T);
        durations(k,2) = toc;
        
        tic
        DMprobs(k,3) = minDMPhoeffding(n,C,T);
        durations(k,3) = toc;
        
        tic
        DMprobs(k,1) = mindeadlinemiss(n, C, T);
        durations(k,1) = toc;
        
        
    end
    avgTimes(:,ordinal) = mean(durations);
    avgDMPs(:,ordinal) = mean(DMprobs);
    disp([num2str(ordinal),'/7 of the experiment is done...'])
end

disp('Generating figures...')

% Approximated average times from von der Brüggen et al. paper (ECRTS 2018) 
% where the original experiment is described.
CB_original = [13.2202, 60, 130.8154 ,270 , 288.4893 ,650 , 1084.9];
UB_original = [0.07, 10, 228, 550, 1300, 1900, 6011];

% Since Hoeffding and Bernstein approaches take a very small amount of time
% to compute, we take into consideration the average of the value for
% taskset size of 35. Matlab's tic toc function does not report
% representative execution times for the values smaller than 0.1 seconds.
Hoeffding_original = 10;
Bernstein_original = 12;
Average_original = (Hoeffding_original + Bernstein_original)/2;

Hoeffding_current_exp = avgTimes(3,7);
Bernstein_current_exp = avgTimes(2,7);
Average_current_exp = (Hoeffding_current_exp + Bernstein_current_exp)/2;

SpeedUpFactor = Average_original/Average_current_exp;

CB_with_speedup = SpeedUpFactor * CB_original;
UB_with_speedup = SpeedUpFactor * UB_original;

x = [5,10,15,20,25,30,35];
y1 = avgTimes(1,:);
y2 = avgTimes(2,:);
y3 = avgTimes(3,:);
y4 = CB_with_speedup;
y5 = UB_with_speedup;
semilogy(x,y1,'--bo',x,y2,'-r',x,y3,'-g',x,y4,'-ks',x,y5,'-k','LineWidth',3);
grid on;
legend('CDMP','BDMP','HDMP','CB','UM');
f = gcf;
exportgraphics(f,[mfilename('fullpath'), '_(a).png']);
    

y1 = avgDMPs(1,:);
y2 = avgDMPs(2,:);
y3 = avgDMPs(3,:);
semilogy(x,y1,'--bo',x,y2,'-r',x,y3,'-g','LineWidth',3);
grid on;
legend('CDMP','BDMP','HDMP');
f = gcf;
exportgraphics(f,[mfilename('fullpath'), '_(b).png']);
    
disp('Experiment done. Check the generated figures under the directory /experiments/5-3 Computation of the deadline miss probability/')

    
    