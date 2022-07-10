function r = fxy(f, x, y)
    % =========================================================================
    % Approximation of the fxy derivative.
    % =========================================================================
    
    dim = size(f);
    if(x == 1 || x == dim(2) || y == 1 || y == dim(1)) 
        r = 0;
        return;
    endif
    r = (fy(f, x + 1, y) - fy(f, x - 1, y)) / 2;

endfunction