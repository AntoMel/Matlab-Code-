% ==============================================================================
%   volatility.m: --------------------------------------------------------------
% ==============================================================================

%   functions ------------------------------------------------------------------
% ==============================================================================
function volatility
    
    function r = getChangePriceFor(array_x, delta_t)
        % documentation ------------------------------------------------------------
        % input: array_x = prices [nx1 array]
        % input: delta_t = time step [int]
        % output: r      = price changes [nx1-array]
    
        % To program
            % r = array_x - shifted array_y
            % consider to change the length of r or set marginal values to a constant value
    
        % consider to change the length of r or set marginal values to a constant value
            array_temp_x = zeros(size(array_x,1),1);
            for i = 1 : size(array_x,1) - delta_t
                    array_temp_x(i) = array_x(i) - array_x(i + delta_t);
            end
            r = array_temp_x;
    end
    
    function r = getChangePriceVector(array_x, delta_t)
        % documentation ------------------------------------------------------------
        % input: array_x = prices [nx1 array]
        % input: delta_t = time step [int]
        % output: r      = price changes [nx1-array]
    
        % To program
            % r = array_x - shifted array_y
            % consider to change the length of r or set marginal values to a constant value
    
        % consider to change the length of r or set marginal values to a constant value
        array_shifted_x = [array_x(delta_t+1:end,1 ); array_x(end-delta_t+1:end,1)];
        r = array_x - array_shifted_x;
    end

    function [V,Q] = getVolatilityRatio(array_x, n_S, delta_t)
        % documentation ------------------------------------------------------------
        % input: array_x = prices [nx1 array]
        % input: n_S     = number of applying delta_t (S=n_S*delta_t) [int]
        % input: delta_t = time step [integer]
        % output: V      = volatility [float]
        % output: Q      = volatility ratio [float]
    
        r = getChangePriceVector(array_x, delta_t);
    
        temp  = sum(abs(array_x));
    
        V = temp/length(array_x);
        Q = abs( sum(r) ) / temp;
    end

    %   main  ----------------------------------------------------------------------
    % ==============================================================================
    
    % load matrix
    
    % matrix = ...
    
    % simulate matrix
    x = (ones(10,1)*[0 : 1 : 10])'
    
    % test computing price change with loop
    r = getChangePriceFor(x(:,1), 3)
    
    % test computing price change with vector algebra
    r = getChangePriceVector(x(:,1), 3)
    
    delta_t=3;
    r(1:end-delta_t,1)
    [Q, V] = getVolatilityRatio(r(1:end-delta_t,1), 0, delta_t)
    
end
