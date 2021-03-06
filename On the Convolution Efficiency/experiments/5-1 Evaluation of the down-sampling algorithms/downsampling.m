% This script computes the experiments presented under Section 5.1 of our
% paper. Three figures, corresponding to Figures, 4(a), 4(b), and 4(c),  
% from the paper, are generated when running this script.

disp('Experiment started. Wait for the confirmation about its finalisation.')


avgTimes = zeros(5,4); % collection for the average execution times for each method
avgExpectation = zeros(1,5); % collection for the average deadline miss probabilities
avgExceedence = zeros(1,5);

%%%%%% IMPORTANT %%%%%%
NoOfRuns = 25; 
% NoOfRuns = 1000; % Number of runs for the original experiment
% If on your machine it takes too long to perform this script, reduce the above number
% It represents a number of runs per each point in the graph.
% Reducing this number increases the standard deviation of the results.
% Increasing this number reduces the standard deviation of the results.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Experiment represented in Figures 4(a), 4(b), and 4(c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

R = 20;

for ordinal = 1:5
    N = ordinal * 200; % Size of random variable varies from 200 to 1000, by 200.
    
    expectations = zeros(NoOfRuns,5);
    computation_times = zeros(NoOfRuns,4);
    excedence = zeros(NoOfRuns,5);
    for i = 1:NoOfRuns
        
        randomArray = UUniFast(N,1);
        
        X = zeros(2,length(randomArray));
        X(2,:) = randomArray;
        X(1,:) = 1:length(randomArray);
        
        tic;
        P = pessimismresampling(X,R);
        computation_times(i,1) = toc;
        expectations(i,1) = expectationofrandomvariable(P);
        excedence(i,1) = exceedenceprob(P,length(X)/2);
        
        
        tic;
        QD = domainquantisation(X,round(length(X)/(R)));
        computation_times(i,2) = toc;
        expectations(i,2) = expectationofrandomvariable(QD);
        excedence(i,2) = exceedenceprob(QD,length(X)/2);
        
        
        tic;
        L = linear(X,R);
        computation_times(i,3) = toc;
        expectations(i,3) = expectationofrandomvariable(L);
        excedence(i,3) = exceedenceprob(L,length(X)/2);
        
        
        tic;
        O = optimal(X,R-1);
        computation_times(i,4) = toc;
        expectations(i,4) = expectationofrandomvariable(O);
        excedence(i,4) = exceedenceprob(O,length(X)/2);
        
        expectations(i,5) = expectationofrandomvariable(X);
        excedence(i,5) = exceedenceprob(X,length(X)/2);
        
    end
    
    avgTimes(ordinal,:) = mean(computation_times);
    if (N == 600)
        avgExpectation = mean(expectations);
        avgExceedence = mean(excedence);
    end
    
    
    disp([num2str(ordinal),'/5 of the experiment is done...'])
    
end

x = [200,400,600,800,1000];

% Execution times bellow the 1/10 second threshold may not
% represent useful data according to Matlab documentation for functions
% tic and toc. Because of this, scaling of the methods might not be correct.
% For this reason, we check if the execution times fall bellow the 1/10 
% seconds threshold, defined in the Matlab documentation for tic and toc. 
% If yes, then we report the 1/10.

y1 = avgTimes(:,1);
y1 = max(y1, [0.1;0.1;0.1;0.1;0.1]);
y2 = avgTimes(:,2);
y2 = max(y2, [0.1;0.1;0.1;0.1;0.1]);
y3 = avgTimes(:,3);
y3 = max(y3, [0.1;0.1;0.1;0.1;0.1]);
y4 = avgTimes(:,4);
y4 = max(y4, [0.1;0.1;0.1;0.1;0.1]);


semilogy(x,y1,'--bo',x,y2,'-rs',x,y3,'-go',x,y4,'-k*','LineWidth',3);
grid on;
legend('PR','DQ','LN','OP');
f = gcf;
exportgraphics(f,[mfilename('fullpath'), '_(a).png']);

name = {'PR';'DQ';'LN';'OP';'X'};
x = [1,2,3,4,5];
y = avgExpectation; 
bar(x,y);
ylim([290 325]);
set(gca,'xticklabel',name);
f = gcf;
exportgraphics(f,[mfilename('fullpath'), '_(b).png']);


name = {'PR';'DQ';'LN';'OP';'X'};
x = [1,2,3,4,5];
y = avgExceedence; 
bar(x,y);
ylim([0.48 0.58]);
set(gca,'xticklabel',name);
f = gcf;
exportgraphics(f,[mfilename('fullpath'), '_(c).png']);


disp('Experiment done. Check the generated figures under the directory /experiments/5-1 Evaluation of the down-sampling algorithms/')

