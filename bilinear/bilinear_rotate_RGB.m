function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Rotate image using bilinear interpolation.
    % img is RGB.
    % =========================================================================
    
    % extract channels
    red = img(:, :, 1);
    green = img(:, :, 2);
    blue = img(:, :, 3);

    % Apply rotation on all channels
    red_out = bilinear_rotate(red, rotation_angle);
    green_out = bilinear_rotate(green, rotation_angle);
    blue_out = bilinear_rotate(blue, rotation_angle);
    
    % final image
    out = cat(3, red_out, green_out, blue_out);
    
endfunction