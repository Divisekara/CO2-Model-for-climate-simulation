function[particular_rate1,particular_rate2,particular_rate3] = scenarios(particular_year)
%Function for the source term
    particular_year = round(particular_year);
    
    years = [1000 1850 1950 1980 2020    2050 2100 2120 2150 2225 2300 2500 2950 5000]; 
    rates1 = [0.0 0.0  1.0  4.0  6.4702  8.0  10.0 10.5 10.0 3.5  2.0  0.0  0.0  0.0]; %Nominal 
    rates2 = [0.0 0.0  1.0  4.0  6.4702  10.0 13.0 14.0 11.5 7.0  5.0  3.0  2.01 0.0]; %Trump wins
    rates3 = [0.0 0.0  1.0  4.0  6.4702  8.0  11.0 12.0 0.0 -3.5  -5.5 -2.5 0.0  0.0]; %Negative CO2 makes
    
    x = 1000:1:5000; %Time daomin
    
    %  nearest , linear , spline , pchip
    y1 = interp1(years,rates1,x,'pchip'); %Using the interpolation
    y2 = interp1(years,rates2,x,'pchip');
    y3 = interp1(years,rates3,x,'pchip');
    
    figure('Name', 'Question no.4: Various scenarios')
    plot(x,y1,'b')
    hold on
    plot(x,y2,'r')
    plot(x,y3,'g'),title('Source Term: Fossil Fuels'),xlabel('time [years, CE]'),ylabel('source term, f(t)');set(gca,'XMinorTick','on','YMinorTick','on')
    legend('Nominal', 'Trump', 'Clever')
    grid on
    ylim([-10,15]);
    
     %% This chooese the particular year is within the considered domain or else.
    if 1000<particular_year && particular_year<5000
        particular_rate1 = y1(particular_year-1000);
        particular_rate2 = y2(particular_year-1000);
        particular_rate3 = y3(particular_year-1000);
    else
        particular_rate1 = 0;
        particular_rate2 = 0;
        particular_rate3 = 0;
    end
end