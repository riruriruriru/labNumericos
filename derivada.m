function [fdx] = derivada(f,h,variable,valores)
%DERIVADA Summary of this function goes here
%   Detailed explanation goes here
cell = num2cell(valores);
values1 = cell;
values2 = cell;
[n,m] = size(cell);
a = h;
b = h;
for i=1:n
    if cell{i} == variable
        values1{i} = variable + h;
        values2{i} = variable - h;
    end
end

fdx = (f(values1{:})-f(values2{:}))/(2*h);
end

