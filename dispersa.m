function [respuesta] = dispersa(matriz)
%DISPERSA Summary of this function goes here
%   Detailed explanation goes here
[n,m] = size(matriz);
mitadTotal = (n*m)/2;
contador = 0;
for i=1:n
    for j=1:m
        if matriz(i,j) == 0
            contador = contador + 1;
        end
    end
end
if contador >= mitadTotal
    respuesta = true
else
    respuesta = false
end
end

