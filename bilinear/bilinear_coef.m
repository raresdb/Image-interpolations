function a = bilinear_coef(f, x1, y1, x2, y2)
    % =========================================================================
    % Compute the bilinear interpolation coefficients.
    % (x1, y1), (x1, y2), (x2, y1) and (x2, y2)
    % =========================================================================
    
    % compute matrix
    A = [1 x1 y1 x1 * y1 ; 1 x1 y2 x1 * y2 ; 1 x2 y1 x2 * y1 ; 1 x2 y2 x2 * y2];
    
    % compute vector
    b = [f(y1, x1) f(y2, x1) f(y1, x2) f(y2, x2)]';
    b = double(b);
    
    % compute coefficients
    a = zeros(4,1);
    a = A \ b;

endfunction
