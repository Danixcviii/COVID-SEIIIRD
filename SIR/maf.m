function [y] = maf(x, t, n)
    N = ones(1, n);
    N(end) = 0;
    D = zeros(1, n);
    D(1) = n;
    
    H = tf(N, D, 1);
  
    y = lsim(H, x, t);
end
