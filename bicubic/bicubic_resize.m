function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Resize to p x q.
    % =========================================================================

    [m n nr_colors] = size(I);

    R = zeros(p, q);
    I = double(I);
    
    % Ignore RGB images.
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % (0, 0) doesn't move


    % scaling factors
    sx = (q - 1) / (n - 1);
    sy = (p - 1) / (m - 1);

    % resize matrix
    T = [sx 0; 0 sy];
    T_inv = [1/sx 0; 0 1/sy];
    
    % calculate the derivatives
    [Ix, Iy, Ixy] = precalc_d(I);
    
    % parse all pixels
    for y = 0 : p - 1
        for x = 0 : q - 1
            % find original coordinates
            coord_p = T_inv * [x,y]';
            coord_p = coord_p + [1,1];
            xp = coord_p(1);
            yp = coord_p(2);
            
            [x1, y1, x2, y2] = surrounding_points(n, m, xp, yp);
            A = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);
            
            % Find the coordinates in relation to x1, y1
            xp -= x1;
            yp -= y1;
            
            % Calculate value of the pixel
            R(y + 1,x + 1) = [1, xp, xp^2, xp^3] * A * [1, yp, yp^2, yp^3]';
            
        endfor
    endfor

    R = uint8(R);
    
endfunction





