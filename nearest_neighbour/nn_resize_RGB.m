function out = nn_resize_RGB(img, p, q)
    % =========================================================================
    % Resize image to p x q.
    % img is RGB.
    % =========================================================================

    % red channel
    red = img(:, :, 1);
    
    % green channel
    green = img(:, :, 2);

    % blue channel
    blue = img(:, :, 3);
    
    % resize all 3 channels
    red_out = nn_resize(red, p, q);
    green_out = nn_resize(green, p, q);
    blue_out = nn_resize(blue, p, q);
    
    % final image
    out = cat(3, red_out, green_out, blue_out);

endfunction
