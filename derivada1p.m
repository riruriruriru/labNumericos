function [x] = derivada1p(f, x0)
    x = (f(x0 + 0.00001) - f(x0))/0.00001;
end