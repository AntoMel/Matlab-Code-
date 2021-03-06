clear
load('Data.mat');

% create table for calculations
bid = table2array(Data(:,1:4));
ask = table2array(Data(:,6:9));

% calculate bid and ask price minutely
bid_price = mean(bid,2);
ask_price = mean(ask,2);

% calculate minutely price, return, spread

minutely_price = (log(bid_price) + log(ask_price))/2;

minutely_return = (minutely_price(2:end,:)./minutely_price(1:(end-1),:));

minutely_spread = log(ask_price) - log(bid_price);


% create timestamp for timetable
t1 = datetime(2018,01,01,0,0,0);
t2 = datetime(2019,01,01,23,59,00);

Timestamp = t1:minutes(1):t2;
Timestamp = Timestamp.';

% create an extra timestamp for the returns, delete first element of array

Timestamp_1 = Timestamp;
Timestamp_1(1) = [];

% create new timetables on minutely basis

tt_minutely_price = timetable(Timestamp,minutely_price);

tt_minutely_return = timetable(Timestamp_1,minutely_return);

tt_minutely_spread = timetable(Timestamp,minutely_spread);

% hourly calculations

hourly_price = retime(tt_minutely_price,'hourly','mean');

hourly_return = retime(tt_minutely_return,'hourly','mean');

hourly_spread = retime(tt_minutely_spread,'hourly','mean');

% daily calculations

daily_price = retime(tt_minutely_price,'daily','mean');

daily_return = retime(tt_minutely_return,'daily','mean');

daily_spread = retime(tt_minutely_spread,'daily','mean');

% weekly calculations

weekly_price =  retime(tt_minutely_price,'weekly','mean');

weekly_return =  retime(tt_minutely_return,'weekly','mean');

weekly_spread =  retime(tt_minutely_spread,'weekly','mean');

% monthly calculations

monthly_price =  retime(tt_minutely_price,'monthly','mean');

monthly_return =  retime(tt_minutely_return,'monthly','mean');

monthly_spread =  retime(tt_minutely_spread,'monthly','mean');

% Ich will hier immer fortlaufen Preis von t - (t-Delata10 Minuten) berechnen


% Firstly allocation of target array if using for loops! Otherwise you get problems
% target_array = zeros(size(minutely_price,1),1)
% I think, a for loop is in such a case not meaningful. A concatenation of arrays is still better:
target_array = minutely_price(1+10:end,1) - minutely_price(1:end-10,1)

for i = size(minutely_price,1)
    % This solution ca't work, beacuse you always create a array with length end-i (minutely_price(i:end,1)), subtract another array with length end-10 - (i-10) = end - i, which results in a vetor. But you assign it to a scalar (tenminutes_return(i,1)). Moreover, you want to access values which are not existing, for example if i = 1, you want to access in array minutely_price on position i-10 = -9 . This isnt defined. Can't work. You have to use if conditions.
    tenminutes_return(i,1) = minutely_price(i:end,1) - minutely_price(i-10:(end-10),1);
end 
