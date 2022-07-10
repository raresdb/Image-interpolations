function [x1 y1 x2 y2] = surrounding_points(n, m, x, y)
    % =========================================================================
    % Find surrounding points for (x,y).
    % n x m dimensions of the image
    % =========================================================================
    
    % Calculate the surrounding points
    x1 = floor(x);
    x2 = x1 + 1;
    y1 = floor(y);
    y2 = y1 + 1;
    
    % making sure the bounds are respected
    if(y1 == m)
        y1 -= 1;
        y2 -= 1;
    endif
     if(x1 == n)
        x1 -= 1;
        x2 -= 1;
    endif
    
endfunction