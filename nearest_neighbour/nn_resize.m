
function R = nn_resize(I, p, q)
    % =========================================================================
    % Resize to p x q
    % =========================================================================
    [m n nr_colors] = size(I);

    % ignores RGB images
    if nr_colors > 1
        R = -1;
        return
    endif
    
    I = double(I);
    R = zeros(p, q);

    % Obs:
    % (0, 0) dot will stay in its place.

    % Calculate scaling factors
    sx = (q - 1) / (n - 1);
    sy = (p - 1) / (m - 1);

    % Matrix used for redimensioning
    T = [sx 0; 0 sy];
    T_inv = [1/sx 0; 0 1/sy];
    
    % Parse all pixels from the image
    for y = 0 : p - 1
        for x = 0 : q - 1
            % Find the coordinates from the original image
            coord_p = T_inv * [x,y]';
            coord_p = coord_p + [1,1];
            
            % Find nearest neighbour
            xp = coord_p(1);
            yp = coord_p(2);
            
            if(ceil(xp) - xp <= 0.5)
                xp = ceil(xp);
            else
                xp = floor(xp);
            endif
            
            if(ceil(yp) - yp <= 0.5)
                yp = ceil(yp);
            else
                yp = floor(yp);
            endif

            % Final pixel value
            R(y + 1,x + 1) = I(yp,xp);
        endfor
    endfor
    
    R = uint8(R);

endfunction
