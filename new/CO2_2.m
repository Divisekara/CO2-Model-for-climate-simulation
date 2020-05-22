particular_year = round(particular_year);
years = [1000 1850 1950 1980 2050 2100 2120 2150 2225 2300 2500 5000];
rates = [0.0 0.0 1.0 4.0 8.0 10.0 10.5 10.0 3.5 2.0 0.0 0.0];
x = 1000:1:5000;

%  nearest , linear , spline , pchip
y = interp1(years,rates,x,'pchip'); %Using the interpolation
figure(1);
plot(x,y),title('Source Term: Fossil Fuels'),xlabel('time [years, CE]'),ylabel('source term, f(t)'),set(gca,'XMinorTick','on','YMinorTick','on')
ylim([-1,12])

if 1000<particular_year && particular_year<5000
    particular_rate = y(particular_year-1000);
else
    particular_rate = 0;
end


figure(2);

d = 8.64;                %transfer time
u_1 = 4.95*10^2;
u_2 = 4.95*10^(-2);
v_s = 0.12;
v_d = 1.23;
w   = 10^(-3);
k1  = 2.19*10^(-4);
k2  = 6.12*10^(-5);
k3  = 0.997148;
k_4 = 6.79*10^(-2);

t_interval = 1000:5000;

%%
p = D(1);
sigma_s = D(2);
sigma_d = D(3);
alpha_s = D(4); 
alpha_d = D(5);

%%
h_s = (sigma_s - sqrt(sigma_s^2 - k3*alpha_s*(2*sigma_s - alpha_s)))/k3;
c_s = (alpha_s - h_s)/2;
p_s = k4 * h_s^2 /c_s;

derivatives=[   (p_s - p)/(d) + f/u_1 ;
                ((sigma_d - sigma_s)*w - k1 - (p_s - p)/d*u_2)/v_s;
                (k1-(sigma_d - sigma_s)*w)/v_d;
                ((alpha_d - alpha_s)*w - k2)/v_s;
                (k2 - (alpha_d - alpha_s)*w)/v_d];

%%





