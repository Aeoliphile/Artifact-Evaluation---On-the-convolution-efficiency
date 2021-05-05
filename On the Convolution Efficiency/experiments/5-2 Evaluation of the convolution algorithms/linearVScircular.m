% This script computes the experiments presented under Section 5.2 of our
% paper. Three figures, corresponding to Figures, 5(a), 5(b), and 5(c),  
% from the paper, are generated when runningthis script.


disp('Experiment started. Wait for the confirmation about its finalisation.')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Experiment represented in Figure 5 (a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 100;
X = UUniFast(N,1);
X = mp(X);


marksLC = [2,4,8,16,32,64,128,256];
% marksLC = [2,4,8,16,32,64,128,256,512]; % Marks for the original experiment

marksCC_BC = [2,4,8,16,32,64,128,256,512,1024,2048,4096];
% marksCC_BC = [2,4,8,16,32,64,128,256,512,1024,2048,4096,8192]; % Marks for the
% original experiment

marksCC_WC = marksCC_BC-1;

exec_time_LC = zeros(1,length(marksLC));
exec_time_CC_BC = zeros(1,length(marksCC_BC));
exec_time_CC_WC = zeros(1,length(marksCC_WC));

for i = 1:length(marksLC)
    tic
        a = lconv(X,marksLC(i));
    exec_time_LC(i) = toc;
end

for i = 1:length(marksCC_BC)
    tic
        a = cconv(X,marksCC_BC(i));
    exec_time_CC_BC(i) = toc;
end

for i = 1:length(marksCC_WC)
    tic
        a = cconv(X,marksCC_WC(i));
    exec_time_CC_WC(i) = toc;
end


y1_1 = exec_time_CC_BC;
y1_2 = exec_time_CC_WC;
y1_3 = exec_time_LC;

x1_1 = marksCC_BC;
x1_2 = marksCC_WC;
x1_3 = marksLC;

disp('1/3 of the experiment is done...')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Experiment represented in Figure 5 (b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 1000;
X = UUniFast(N,1);
X = mp(X);


marksLC = [2,4,8,16,32];
% marksLC = [2,4,8,16,32,64]; % Marks for the original experiment

marksCC_BC = [2,4,8,16,32,64,128,256,512,1024,2048];
% marksCC_BC = [2,4,8,16,32,64,128,256,512,1024,2048,4096]; % Marks for the
% original experiment

marksCC_WC = marksCC_BC-1;

exec_time_LC = zeros(1,length(marksLC));
exec_time_CC_BC = zeros(1,length(marksCC_BC));
exec_time_CC_WC = zeros(1,length(marksCC_WC));

for i = 1:length(marksLC)
    tic
        a = lconv(X,marksLC(i));
    exec_time_LC(i) = toc;
end

for i = 1:length(marksCC_BC)
    tic
        a = cconv(X,marksCC_BC(i));
    exec_time_CC_BC(i) = toc;
end

for i = 1:length(marksCC_WC)
    tic
        a = cconv(X,marksCC_WC(i));
    exec_time_CC_WC(i) = toc;
end


y2_1 = exec_time_CC_BC;
y2_2 = exec_time_CC_WC;
y2_3 = exec_time_LC;

x2_1 = marksCC_BC;
x2_2 = marksCC_WC;
x2_3 = marksLC;

disp('2/3 of the experiment is done...')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Experiment represented in Figure 5 (c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 10000;
X = UUniFast(N,1);
X = mp(X);


marksLC = [2,4];
% marksLC = [2,4,8]; % Marks for the original experiment

marksCC_BC = [2,4,8,16,32,64,128,256];
% marksCC_BC = [2,4,8,16,32,64,128,256,512]; % Marks for the
% original experiment

marksCC_WC = marksCC_BC-1;
exec_time_LC = zeros(1,length(marksLC));
exec_time_CC_BC = zeros(1,length(marksCC_BC));
exec_time_CC_WC = zeros(1,length(marksCC_WC));

for i = 1:length(marksLC)
    tic
        a = lconv(X,marksLC(i));
    exec_time_LC(i) = toc;
end

for i = 1:length(marksCC_BC)
    tic
        a = cconv(X,marksCC_BC(i));
    exec_time_CC_BC(i) = toc;
end

for i = 1:length(marksCC_WC)
    tic
        a = cconv(X,marksCC_WC(i));
    exec_time_CC_WC(i) = toc;
end

y3_1 = exec_time_CC_BC;
y3_2 = exec_time_CC_WC;
y3_3 = exec_time_LC;

x3_1 = marksCC_BC;
x3_2 = marksCC_WC;
x3_3 = marksLC;

disp('3/3 of the experiment is done...Image generation in progress...')


%%%%%%%%%%%%%%%%%%%%
%%% IMAGE GENERATION
%%%%%%%%%%%%%%%%%%%%


% Generation of image (a)

plot(x1_1,y1_1,'--bo',x1_2,y1_2,'-rs',x1_3,y1_3,'-ko','LineWidth',3);
grid on;
legend('CC-BC','CC-WC','LC');
f = gcf;
exportgraphics(f,[mfilename('fullpath'), '_(a).png']);


% Generation of image (b)

plot(x2_1,y2_1,'--bo',x2_2,y2_2,'-rs',x2_3,y2_3,'-ko','LineWidth',3);
grid on;
legend('CC-BC','CC-WC','LC');
f = gcf;
exportgraphics(f,[mfilename('fullpath'), '_(b).png']);


% Generation of image (c)

plot(x3_1,y3_1,'--bo',x3_2,y3_2,'-rs',x3_3,y3_3,'-ko','LineWidth',3);
grid on;
legend('CC-BC','CC-WC','LC');
f = gcf;
exportgraphics(f,[mfilename('fullpath'), '_(c).png']);



disp('Experiment done. Check the generated figures under the directory /experiments/5-2 Evaluation of the convolution algorithms/')



