function out = bilinear_2x2(f, STEP = 0.1)
    % =========================================================================
    % Apply bilinear interpolation on f.
    % f has known values in positions (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parameters:
    % - f = image to interpolate
    % - STEP = distance between 2 succesive dots.
    % =========================================================================

    % coordinates for intermediary dots
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;

    n = length(x_int);

    % margin dots
    x1 = y1 = 1;
    x2 = y2 = 2;

    a = bilinear_coef(f, x1, y1, x2, y2);
    out = zeros(n,n);
    
    % parse all pixels from final image
    for i = 1 : n
        for j = 1 : n
            % TODO: compute value
            x = x_int(j);
            y = y_int(i);
            out(i,j) = [1, x, y, x * y] * a;

        endfor
    endfor

    out = uint8(out);

endfunction
