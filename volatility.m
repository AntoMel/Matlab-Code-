% ==============================================================================
%   volatility.m: --------------------------------------------------------------
% ==============================================================================

%   functions ------------------------------------------------------------------
% ==============================================================================

function r = getChangePrice(array_x, delta_t)
    % documentation ------------------------------------------------------------
    % input: array_x = prices [nx1 array]
    % input: delta_t = time step [int]
    % output: r      = price changes [nx1-array]

    % To program
        % r = array_x - shifted array_y
        % consider to change the length of r or set marginal values to a constant value
    
end

function [V,Q] = getVolatilityRatio(array_x, n_S, delta_t)
    % documentation ------------------------------------------------------------
    % input: array_x = prices [nx1 array]
    % input: n_S     = number of applying delta_t (S=n_S*delta_t) [int]
    % input: delta_t = time step [integer]
    % output: V      = volatility [float]
    % output: Q      = volatility ratio [float]

    r = getChangePrice(array_x));

    temp  = sum( abs( x );

    V = temp / length(x);
    Q = abs( sum(r) ) / temp
end

%   main  ----------------------------------------------------------------------
% ==============================================================================

% load matrix

matrix = ...

% compute volatility for a specific column col of matrix, n_S(S=n_S*delta_t) and delta_t

[Q, V] = getVolatilityRatio(matrix(:, col), n_S, delta_t)