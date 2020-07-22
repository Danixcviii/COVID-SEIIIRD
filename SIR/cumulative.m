function y = cumulative(x)
    y = zeros(size(x));
    y(1) = x(1);
    for k = 2 : length(x)
       y(k) = x(k) + y(k-1);
    end
end