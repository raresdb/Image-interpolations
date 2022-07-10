function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculate bicubic interpolation coefficients.
    % =========================================================================

    % Calculate intermediary matrixes
    T1 = [1, 0, 0, 0; 0, 0, 1, 0; -3, 3, -2, -1; 2, -2, 1, 1];
    T2 = [1, 0, -3, 2; 0, 0, 3, -2; 0, 1, -2, 1; 0, 0, -1, 1];
    line1 = [f(y1, x1) f(y2, x1) Iy(y1, x1) Iy(y2, x1)];
    line2 = [f(y1, x2) f(y2, x2) Iy(y1, x2) Iy(y2, x2)];
    line3 = [Ix(y1, x1) Ix(y2, x1) Ixy(y1, x1) Ixy(y2, x1)];
    line4 = [Ix(y1, x2) Ix(y2, x2) Ixy(y1, x2) Ixy(y2, x2)];
    F = [line1; line2; line3; line4];
  
    T1 = double(T1);
    T2 = double(T2);
    F = double(F);
    
    % Final matrix
    A = T1 * F * T2;
    
endfunction