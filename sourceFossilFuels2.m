function[particular_rate] = sourceFossilFuels2(particular_year)
    %This function used for question no.2 ode solving, only inside the DEdef function.
    particular_year = round(particular_year);
    
    years = [1000 1850 1950 1980 2050 2100 2120 2150 2225 2300 2500 5000]; %given particular years
    rates1 = [0.0 0.0 1.0 4.0 8.0 10.0 10.5 10.0 3.5 2.0 0.0 0.0]; %given rates for the particular years
    
    x = 1000:1:5000; %Time daomin

    y = interp1(years,rates1,x,'pchip'); %Using the interpolation

    %% This chooese the particular year is within the considered domain or else.
    if 1000<particular_year && particular_year<5000
        particular_rate = y(particular_year-1000);
    else
        particular_rate = 0;
    end
end
