function y = error(data, x, t)
    dt = t(2) - t(1);
    x = x(1:length(data));
    y = sum(t.*abs(data - x))*dt;
end