function [ADFStat] = ADFTest(array_x)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

array_x = table2array(array_x);

for i = 1:4
    
    [h,pValue,stat,cValue] = adftest(array_x(:,i));
end
    
    
ADFStat = table(h,pValue,stat,cValue,'RowNames',{'EUR_USD''GBP_USD''USD_CHF''USD_JPY'});
end

