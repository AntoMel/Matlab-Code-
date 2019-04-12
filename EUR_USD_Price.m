load('Data.mat');
%Data = readtable('Data.xlsx');

Data = table2array(Data);

% create timestamp for easier calculations with arrays and later be able to generate a
% timetable 

t1 = datetime(2018,01,01,0,0,0);
t2 = datetime(2019,01,01,23,59,00);
Timestamp = t1:minutes(1):t2;
Timestamp = Timestamp.';

% create an extra timestamp for the returns, delete first cell

Timestamp_1 = Timestamp;
Timestamp_1(1) = [];

% prepare for calculations

bid = Data(:,1:4);
ask = Data(:,6:9);

bid_price = mean(bid,2);
ask_price = mean(ask,2);

%calculate price, return, spread

EUR_USD_price = (log(bid_price) + log(ask_price))/2;

EUR_USD_return = log(EUR_USD_price(2:end,:)./EUR_USD_price(1:(end-1),:));

EUR_USD_spread = log(ask_price) - log(bid_price);

% create timetable of calculations

EUR_USD_return = timetable(Timestamp_1,EUR_USD_return);
EUR_USD_spread = timetable(Timestamp,EUR_USD_spread);
price_EUR_USD = timetable(Timestamp,EUR_USD_price);
Daily_Volatility = retime(EUR_USD_return,'daily','sum');

% calculte absolute vaule of volatility

for i = 1:height(EUR_USD_return)
    func = @sum;
    if i+5<=height(EUR_USD_return)
        EUR_USD_return(i,2) = varfun(func,EUR_USD_return(i+1:i+5,1));
    %elseif i+1<=size(price_EUR_USD)
      %  price_EUR_USD(i,2) = sum(price_EUR_USD(i+1:end,1));
    else 
        EUR_USD_return(i,2) = EUR_USD_return(i,1);
    end
end
for i = 1:height(EUR_USD_return)
    func = @abs;
    EUR_USD_return(i,2) = varfun(func,EUR_USD_return(i,2));
end 