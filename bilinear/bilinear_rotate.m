
function R = bilinear_rotate(I, rotation_angle)
    % =========================================================================
    % Rotate image with a rotation angle.
    % rotation angle expressed in rad.
    % =========================================================================
    
    [m n nr_colors] = size(I);
    
    I = double(I);
    
    % ignore RGB images
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % (0, 0) dot keeps its position.

    % Trigonometric values
    cos_phi = cos(rotation_angle);
    sin_phi = sin(rotation_angle);
    
    R = zeros(0,0);
    
    % Rotation matrix
    T = [cos_phi -sin_phi; sin_phi cos_phi];
    T_inv = [cos_phi sin_phi; -sin_phi cos_phi];

    % parse all pixels
    for y = 0 : m - 1
        for x = 0 : n - 1
            % Find original coordinates
            coord_p = T_inv * [x,y]';
            coord_p = coord_p + [1 1]';
            xp = coord_p(1);
            yp = coord_p(2);
            
            % If the original coordinates are outside the image, the pixel will
            % be black.
            if(xp > n || yp > m || xp < 1 || yp < 1)
              R(y + 1, x + 1) = 0;
              continue;
            endif
            
            [x1, y1, x2, y2] = surrounding_points(n, m, xp, yp);
            a = bilinear_coef(I, x1, y1, x2, y2); 
            
            % Final value
            R(y + 1, x + 1) = [1, xp, yp, xp * yp] * a;

        endfor
    endfor

    R = uint8(R);
    
endfunction
