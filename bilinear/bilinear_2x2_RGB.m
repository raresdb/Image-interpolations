function out = bilinear_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Apply bilinear interpolation on a RGB image.
    % img has known values in the positions (1, 1), (1, 2), (2, 1) si (2, 2).
    
    % Parameters:
    % - img = image to interpolate
    % - STEP = distance between 2 succesive dots
    % =========================================================================

    % red channel
    red = img(:, :, 1);
    
    % green channel
    green = img(:, :, 2);
    
    % blue channel
    blue = img(:, :, 3);

    % bilinear interpolate the channels
    red_out = bilinear_2x2(red, STEP);
    green_out = bilinear_2x2(green, STEP);
    blue_out = bilinear_2x2(blue, STEP);
    
    % final image
    out = cat(3, red_out, green_out, blue_out);
    
endfunction
