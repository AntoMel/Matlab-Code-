clear
load('Data.mat');

% create table for calculations
bid = table2array(Data(:,1:4));
ask = table2array(Data(:,6:9));

% calculate bid and ask price minutely
bid_price = mean(bid,2);
ask_price = mean(ask,2);

% calculate minutely price, return, spread


minutely_spread = log(ask_price) - log(bid_price);


% create timestamp for timetable
t1 = datetime(2018,01,01,0,0,0);
t2 = datetime(2019,01,01,23,59,00);

Timestamp = t1:minutes(1):t2;
Timestamp = Timestamp.';

% create an extra timestamp for the returns, delete first element of array

Timestamp_1 = Timestamp;
Timestamp_1(1) = [];


% different prices 

minutely_price = (log(bid_price) + log(ask_price))/2;

tt_minutely_price = timetable(Timestamp,minutely_price);

hourly_price = retime(tt_minutely_price,'hourly','mean');

daily_price = retime(tt_minutely_price,'daily','mean');

weekly_price =  retime(tt_minutely_price,'weekly','mean');

monthly_price =  retime(tt_minutely_price,'monthly','mean');


% timeinterval for different returns

minutely_return = (minutely_price(2:end,:)./minutely_price(1:(end-1),:));

tenminute_return = minutely_price(1+10:end,1) - minutely_price(1:end-10,1);

onehour_return = minutely_price(1+60:end,1) - minutely_price(1:end-60,1);

sixhour_return = minutely_price(1+360:end,1) - minutely_price(1:end-360,1);

oneday_return = minutely_price(1+1440:end,1) - minutely_price(1:end-1440,1);

oneweek_return = minutely_price(1+10080:end,1) - minutely_price(1:end-10080,1);


% volatility for different time intervals using absolute values
% das war meine Idee der Volatilitäts Berechnung, kommt das so hin?

hourly_vola = retime(tt_minutely_price,'hourly',@mad);

daily_vola = retime(tt_minutely_price,'daily',@mad);

weekly_vola = retime(tt_minutely_price,'weekly',@mad);

monthly_vola = retime(tt_minutely_price,'monthly',@mad);

yearly_vola = retime(tt_minutely_price,'yearly',@mad);