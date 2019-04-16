function [r] = getChangePrice(array_x, delta_t)
    % documentation ------------------------------------------------------------
    % input: array_x = prices [nx1 array]
    % input: delta_t = time step [int]
    % output: r      = price changes [nx1-array]

    % To program
   
    for i = size(array_x,1)
        n = delta_t;    
        if i<=n
            shifted_array_y(i,1) = array_x(i,1);
        else
            shifted_array_y(i,1) = array_x(n+1,1);
        end  
    end
    r = array_x - shifted_array_y;
        % consider to change the length of r or set marginal values to a constant value
    
end
