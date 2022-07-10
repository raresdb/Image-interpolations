function r = fx(f, x, y)
    % =========================================================================
    % Approximation of the fx derivative.
    % =========================================================================

    dim = size(f);
    if(x == 1 || x == dim(2)) 
        r = 0;
        return;
    endif
    r = (f(y, x + 1) - f(y, x - 1)) / 2;
    
endfunction