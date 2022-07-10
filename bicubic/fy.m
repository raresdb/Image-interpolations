function r = fy(f, x, y)
    % =========================================================================
    % Approximation of the fy derivative.
    % =========================================================================
    
    dim = size(f);
    if(y == 1 || y == dim(1)) 
        r = 0;
        return;
     endif
    r = (f(y + 1, x) - f(y - 1, x)) / 2;
    
endfunction