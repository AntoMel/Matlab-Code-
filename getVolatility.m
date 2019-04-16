    function [V] = getVolatility(array_x, delta_t)
        % documentation ------------------------------------------------------------
        % input: array_x = prices [nx1 array]
        % input: n_S     = number of applying delta_t (S=n_S*delta_t) [int]
        % input: delta_t = time step [integer]
        % output: V      = volatility [float]
        % output: Q      = volatility ratio [float]
    
        array_x = abs(array_x);
        
         array_temp_x = zeros(size(array_x,1),1);
            for i = 1 : size(array_x,1)
                if i == 1
                    array_temp_x(i) = 0;
                elseif i == 2
                    array_temp_x(i) = array_x(1,1);
                elseif i <= delta_t
                    array_temp_x(i) = 1/(i-1) * sum(array_x(i-1:-1:1,1));
                elseif i > delta_t
                    array_temp_x(i) = 1/delta_t * sum(array_x(i-1:-1:i-delta_t,1));
                end
            end
                 
    V = array_temp_x;
        
    end