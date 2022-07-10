function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Resize to p x q.
    % img is RGB.
    % =========================================================================

    % extract the 3 channels
    red = img(:, :, 1);
    green = img(:, :, 2);
    blue = img(:, :, 3);
    
    % Resize the 3 channels.
    red_out = bicubic_resize(red, p, q);
    green_out = bicubic_resize(green, p, q);
    blue_out = bicubic_resize(blue, p, q);
    
    % Final image
    out = cat(3, red_out, green_out, blue_out);

endfunction