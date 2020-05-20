function[rate] = f(x)
years = [1000 1850 1950 1980 2050 2100 2120 2150 2225 2300 2500 5000];
rates = [0.0 0.0 1.0 4.0 8.0 10.0 10.5 10.0 3.5 2.0 0.0 0.0];

x = 1000:1:5000;
%nearest , linear , spline , pchip
y = interp1(years,rate,x,'pchip');
y(2020-1000)
plot(years, rate, 'o', x, y)



end
