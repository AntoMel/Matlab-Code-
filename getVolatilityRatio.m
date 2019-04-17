function [vola_ratio] = getVolatilityRatio(array_x, delta_t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

abs_sum_vola = zeros(size(array_x));
sum_abs_vola = zeros(size(array_x));

        [~, ~] = size(array_x);
            for r = 1 : size(array_x,1) 
               for  c = 1 : size(array_x,2)
                   if delta_t > size(array_x(r:end,1))
                       abs_sum_vola(r,c) = 1;
                       sum_abs_vola(r,c) = 1;
                   else
                       abs_sum_vola(r,c) = abs(sum(array_x(r+1:1:r+delta_t,c)));
                       sum_abs_vola(r,c) = sum(abs(array_x(r+1:1:r+delta_t,c)));
                   end
               end
            end
               
                   
vola_ratio = abs_sum_vola ./ sum_abs_vola;

end

