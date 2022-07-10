function out = nn_2x2(f, STEP = 0.1)
    % =========================================================================
    % Apply nearest-neighbour interpolation on the 2x2 image f with equidistant
    % intermediary dots.
    
    % f has known values in the positions (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parameters:
    % - f = image to be interpolated
    % - STEP = distance between 2 succesive dots
    % =========================================================================
    
    % coordinates for dots
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;

    n = length(x_int);

    % The 4 margin points
    x1 = y1 = 1;
    x2 = y2 = 2;

    out = zeros(n,n);
    
    % compute every pixel from the final image
    for i = 1 : n
        for j = 1 : n
            % find closest margin pixel
             if(x_int(i) >= 1.5)
                x = x2;
             else
                x = x1;
             endif
             
             if(y_int(j) >= 1.5)
                y = y2;
             else
                y = y1;
             endif
            
            % copy the value from the margin pixel
            out(i,j) = f(x,y);            
        endfor
    endfor

endfunction
