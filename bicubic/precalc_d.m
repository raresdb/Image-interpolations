function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Precalculate the matrixes that contain the derivatives for all pixels.
    % =========================================================================
    
    [m n nr_colors] = size(I);
    I = double(I);
    
    % Compute fx derivatives in Ix.
    for(y = 1 : m)
    for(x = 1 : n)
        Ix(y, x) = fx(I, x, y);
    endfor
    endfor
    
    % fy in Iy
    for(y = 1 : m)
    for(x = 1 : n)
        Iy(y, x) = fy(I, x, y);
    endfor
    endfor
    
    % fxy in Ixy
    for(y = 1 : m)
    for(x = 1 : n)
        Ixy(y,x) = fxy(I, x, y);
    endfor
    endfor

endfunction
