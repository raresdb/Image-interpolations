
function R = bilinear_resize(I, p, q)
    % =========================================================================
    % Resize image to p x q.
    % =========================================================================
    [m n nr_colors] = size(I);

    R = zeros(p, q);
    I = double(I);
    
    % Ignore RGB images
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % (0, 0) dots keeps its position

    % scaling factors
    sx = (q - 1) / (n - 1);
    sy = (p - 1) / (m - 1);

    % redimension matrix
    T = [sx 0; 0 sy];
    T_inv = [1/sx 0; 0 1/sy];
    
    % parse all pixels
    for y = 0 : p - 1
        for x = 0 : q - 1
            % original image coordinates
            coord_p = T_inv * [x,y]';
            coord_p = coord_p + [1,1];
            xp = coord_p(1);
            yp = coord_p(2);
            
            % surrounding points and coefficient
            [x1, y1, x2, y2] = surrounding_points(n, m, xp, yp);
            a = bilinear_coef(I, x1, y1, x2, y2);
            
            % compute value
            R(y + 1,x + 1) = [1, xp, yp, xp * yp] * a;
       
        endfor
    endfor

    R = uint8(R);
    
endfunction
