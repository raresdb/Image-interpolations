function out = bilinear_resize_RGB(img, p, q)
    % =========================================================================
    % Redimension to p x q.
    % img is RGB
    % =========================================================================

    % extract the 3 channels
    red = img(:, :, 1);
    green = img(:, :, 2);
    blue = img(:, :, 3);

    % apply nn on the 3 channels
    red_out = bilinear_resize(red, p, q);
    green_out = bilinear_resize(green, p, q);
    blue_out = bilinear_resize(blue, p, q);

    % final image
    out = cat(3, red_out, green_out, blue_out);

endfunction