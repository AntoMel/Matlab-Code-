function [vola_ratio] = getVolatilityRatio(array_x, delta_t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% question 1: dimension of array x?
abs_sum_vola = zeros(size(array_x));
sum_abs_vola = zeros(size(array_x));

        
        [~, ~] = size(array_x); % you don't need this command
            for r = 1 : size(array_x,1) 
               for  c = 1 : size(array_x,2) 
                   if delta_t > size(array_x(r:end,1)) % thats a funny  but senseless formulation - you can do it in a more understandable way
                       abs_sum_vola(r,c) = 1;
                       sum_abs_vola(r,c) = 1;
                   else
                       abs_sum_vola(r,c) = abs(sum(array_x(r+1:1:r+delta_t,c))); 
                       sum_abs_vola(r,c) = sum(abs(array_x(r+1:1:r+delta_t,c)));
                   end
               end
            end
            % I think it should work, but its not computationally efficient

            % 1. I Would use the vector interpretation, suggested in volatility.m. The use of loops create much more functional overhead. Loops are easier to understand but not efficient. That means we have to look the computational implementation of convolutions. Do you know why neural nets are using convolutions instead of for loops....? Its a little bit more complicated but I can describe it in a personal talk
            % 2. You recompute the sums every single step in the loop. You should use temporary sums if working with loops. Add the next while subtract the last value. There are compututational limits to consider when working with large datasets. If there are more than one columns you have firstly to remove the second loop. Do you know what I mean?

            % question: dimension of array x? Please define the dimension of array x, so that i can understand the complexity of scale.
                   
vola_ratio = abs_sum_vola ./ sum_abs_vola;

end

