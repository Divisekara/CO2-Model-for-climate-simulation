clc,clear
%%
% A CO2 model for climate simulation
%%
%variables
%%five principal variables
% p =                         Partial pressure of carbo dioxide in the atmosphere
% sigma_s =                   total dissolved carbon concentration in the shallow ocean
% sigma_d =                   total dissolved carbon concentration in the deep ocean
% alpha_s =                   alkalinity in the shallow ocean
% alpha_d =                   alkalinity in the deep ocean

% h_s =                       %hudrogen carbonate in the shallow ocean
% c_s =                        carbonate in the shallow ocean ocean
% p_s =                         partial pressure of gaseous carbon dioxide in the shallow ocean

% source term f(t)

%contants
% d = 8.64;                       transfer time
% u_1 = 4.95*10^2;
% u_2 = 4.95*10^(-2);
% v_s = 0.12;
% v_d = 1.23;
% w   = 10^(-3);
% k1  = 2.19*10^(-4);
% k2  = 6.12*10^(-5);
% k3  = 0.997148;

%Time interval is thousand years agon and few thousand years ahead
% t_interval = 1000:5000;

%Initial Values at t = 1000
% p = 1.00;
% sigma_s = 2.01;
% sigma_d = 2.23;
% alpha_s = 2.20;
% alpha_d = 2.26;

%%

%The rate of change of the five principal variables
% p_derivative = (p_s - p)/(d) + f(t)/u_1
% sigma_s_derivative = ( (sigma_d - sigma_s)*w - k1 - (p_s - p)/d*u_2)/v_s
% sigma_d_derivative = ( k1 - (sigma_d - sigma_s)*w )/v_d
% alpha_s_derivative = ((alpha_d - alpha_s)*w - k2)/v_s
% alpha_d_derivative = (k2 - (alpha_d - alpha_s)*w)/v_d

% The equlibrium between carbon dioxide and the corbonates 
% h_s = (sigma_s - sqrt(sigma_s^2 - k3*alpha_s*(s*sigma_s - alpha_s)))/k3 
% c_s = (alpha_s - h_s)/2
% p_s = k4 * h_s^2 /c_s

%%



