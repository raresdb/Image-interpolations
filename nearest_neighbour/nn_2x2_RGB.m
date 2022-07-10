function out = nn_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Apply nearest-neighbour interpolation on the 2x2 image img with
    % equidistant intermediary dots.
    % img is RGB
    % =========================================================================

    % red channel
    red = img(:, :, 1);
    
    % green channel
    green = img(:, :, 2);
    
    % blue channel
    blue = img(:, :, 3);

    % apply nearest neighbour on the 3 channels
    red_out = nn_2x2(red, STEP);
    green_out = nn_2x2(green, STEP);
    blue_out = nn_2x2(blue, STEP);
    
    % final image
    out = cat(3, red_out, green_out, blue_out);
    
endfunction
