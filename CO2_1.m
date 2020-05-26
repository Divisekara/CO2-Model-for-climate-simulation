clc,clear

%% A CO2 model for climate simulation 

%% variables definitions

% five principal variables
% p: Partial pressure of carbo dioxide in the atmosphere
% sigma_s: total dissolved carbon concentration in the shallow ocean
% sigma_d: total dissolved carbon concentration in the deep ocean
% alpha_s: alkalinity in the shallow ocean
% alpha_d: alkalinity in the deep ocean

% h_s: %hudrogen carbonate in the shallow ocean
% c_s: carbonate in the shallow ocean ocean
% p_s: partial pressure of gaseous carbon dioxide in the shallow ocean

% f(t): source term 

%contants involved in this model
d = 8.64;
u_1 = 4.95*10^2;
u_2 = 4.95*10^(-2);
v_s = 0.12;
v_d = 1.23;
w   = 10^(-3);
k1  = 2.19*10^(-4);
k2  = 6.12*10^(-5);
k3  = 0.997148;
k_4 = 6.79*10^(-2);

%Initial Conditions at t=1000
IC_p = 1.00; % p
IC_sigma_S = 2.01; % sigma_s
IC_sigma_d = 2.23; % sigma_d
IC_alpha_s = 2.20; % alpha_s
IC_alpha_d = 2.26; % alpha_d

domain = [1000 5000]; %time domain for the ODEs, independant variable

IC = [IC_p, IC_sigma_S, IC_sigma_d, IC_alpha_s,IC_alpha_d]; %Taking initial conditions into a vector


%% Question number 1
figure('Name', 'Question no.1 graph','NumberTitle','off');
t=2020;
f = sourceFossilFuels1(t); %This function iinterpolates the given points and output the relevant value for the year 2020.
disp('2020 source term value'),f


%% Question no.2) A)
t=2020;
figure('Name', 'Question 2 graphs: trends','NumberTitle','off');
subplot(4,1,1);
f(t) = sourceFossilFuels1(t); %plotting the source term f(t)

[IVsol, DVsol] = ode23('DEdef', domain, IC); %Solving the system of ODEs. DEdef contains the equations

subplot(4,1,2);
plot(IVsol, DVsol(:,1), 'k'),ylabel('Patm CO2') % plotting partial pressure of the CO2 in the atmosphere
ylim([0,5])

subplot(4,1,3);
plot(IVsol, DVsol(:,2), 'b') % plotting sigma_s
hold on
plot(IVsol, DVsol(:,3), 'r'),ylabel('sigma') %plotting sigma_d
ylim([1.8,2.6])
legend('shallow', 'deep')
hold off

subplot(4,1,4);
plot(IVsol, DVsol(:,4), 'g') %plotting alpha_s
hold on
plot(IVsol, DVsol(:,5), 'm'),ylabel('alpha'),xlabel('Date[yr,CE]') %plotting alpha_d
ylim([2,2.4])
legend('shallow', 'deep')
hold off


%% question 2) B) answer

%Taking the year that atmospheric carbon dioxide reach it's maximum
[val, idx] = max(DVsol(:,1));
maximum_CO2_year = round(IVsol(idx)) 

%% Question 3) A)

%For the sawtooth, see the sigma in deep ocean(total dissolved carbon concentration in the deep ocean)
%magnify it, then you can see. Also following graphs has take out a range
%that clearly shows the sawtooth.

[IVsol, DVsol] = ode23('DEdef', domain, IC); %Solving the system of ODEs. DEdef contains the equations

%sawtooth 1
figure('Name', 'sawtooth example 1','NumberTitle','off');
%Defining the arrays for see a region contains a clear sawtooth
y_array = DVsol(:,2);
y_array = y_array(200:500);
x_array = IVsol(200:500);
plot(x_array, y_array , 'b'),ylabel('sigma_s'),xlabel('Date[yr,CE]') % sigma_s
ylim([2.09,2.19])

%sawtooth 2
figure('Name', 'Sawtooth example 2','NumberTitle','off');
%Defining the arrays for see a region contains a clear sawtooth
y_array = DVsol(:,2);
y_array = y_array(400:500);
x_array = IVsol(400:500);
plot(x_array, y_array , 'b'),ylabel('sigma_s'),xlabel('Date[yr,CE]')  % sigma_d
ylim([2.09,2.19])

%%%%%%%% Oscillation type is 'traingular waves oscillation' %%%%%%%%'

%% Question no. 3) B) first part
% ode23, ode45, ode23s, ode113, ode23s, ode15s, ode23tb

%Following 7 graphs graphs show how these ode solvers behave in this problem.
%Consider the elpased time, sawtooth and accuracy. Then you can comeup with
%the ode15s which is the best for this problem.

%Ode23 solver behavior
fprintf('ode23: ')
tic; [IVsol, DVsol] = ode23('DEdef', domain, IC); toc
figure('Name','ode23 behavior','NumberTitle','off');
plot(IVsol, DVsol(:,2), 'b'),ylabel('t-years'),xlabel('Date[yr,CE]') 

%ode15s solver behavior
fprintf('ode15s: ')
tic; [IVsol, DVsol] = ode15s('DEdef', domain, IC); toc 
figure('Name','ode15s behavior','NumberTitle','off');
plot(IVsol, DVsol(:,2), 'b'),ylabel('t-years'),xlabel('Date[yr,CE]')

%ode23s solver behavior
fprintf('ode23s: ')
tic; [IVsol, DVsol] = ode23s('DEdef', domain, IC); toc
figure('Name','ode23s behavior','NumberTitle','off');
plot(IVsol, DVsol(:,2), 'b'),xlabel('Date[yr,CE]')

%ode45 solver behavior
fprintf('ode45: ')
tic; [IVsol, DVsol] = ode45('DEdef', domain, IC); toc
figure('Name','ode45 behavior','NumberTitle','off');
plot(IVsol, DVsol(:,2), 'b'),xlabel('Date[yr,CE]')

%ode113 solver behavior
fprintf('ode113: ')
tic; [IVsol, DVsol] = ode113('DEdef', domain, IC); toc
figure('Name','ode113 behavior','NumberTitle','off');
plot(IVsol, DVsol(:,2), 'b'),xlabel('Date[yr,CE]')

%ode23t solver behavior
fprintf('ode23t: ')
tic; [IVsol, DVsol] = ode23t('DEdef', domain, IC); toc
figure('Name','ode23t behavior','NumberTitle','off');
plot(IVsol, DVsol(:,2), 'b'),xlabel('Date[yr,CE]')  % sigma_s

%ode23tb solver behavior
fprintf('ode23tb: ')
tic; [IVsol, DVsol] = ode23tb('DEdef', domain, IC); toc
figure('Name','ode23tb behavior','NumberTitle','off');
plot(IVsol, DVsol(:,2), 'b'),xlabel('Date[yr,CE]')  % sigma_s

disp("")

%According to the elapsed time, printing on the command window, we can compare the computational costs.
%These 7 figures shows us how the ode solvers outputs
%ode15s is the best for this problem considering the computational cost and
%accuracy of the solution(no sawtooth)

%% Question no. 3) B) second part

%Use varios tolerences take the details printing on the command window.
options = odeset('RelTol',1e-6,'AbsTol',1e-6,'stats','on');

%ode23 Solver
fprintf('ode23: ')
figure('Name','ode23','NumberTitle','off');
tic; ode23('DEdef', domain, IC, options); toc %Calculating the elpased time
disp(" ")

%ode15s Solver
fprintf('ode15s: ')
figure('Name','ode15s','NumberTitle','off');
tic; ode15s('DEdef', domain, IC, options); toc %Calculating the elpased time
disp(" ")

%ode23s Solver
fprintf('ode23s: ')
figure('Name','ode23s','NumberTitle','off');
tic; ode23s('DEdef', domain, IC, options); toc %Calculating the elpased time
disp(" ")

%ode45 Solver
fprintf('ode45: ')
figure('Name','ode45');
tic; ode45('DEdef', domain, IC, options); toc %Calculating the elpased time
disp(" ")

%ode113 Solver
fprintf('ode113: ')
figure('Name','ode113','NumberTitle','off');
tic; ode113('DEdef', domain, IC, options); toc %Calculating the elpased time
disp(" ")

%ode23t Solver
fprintf('ode23t: ')
figure('Name','ode23t','NumberTitle','off');
tic; ode23t('DEdef', domain, IC, options); toc %Calculating the elpased time
disp(" ")

%ode23tb Solver
fprintf('ode23tb: ')
figure('Name','ode23tb','NumberTitle','off');
tic; ode23tb('DEdef', domain, IC, options); toc %Calculating the elpased time
disp(" ")

%% Question no 4
[rate1, rate2, rate3]=scenarios(2075);

%Rates at the 2075 for three scenarios
fprintf('nominal rate:'), rate1
fprintf('Trump wins :'), rate2
fprintf('Negative carbo :'), rate3

%%
