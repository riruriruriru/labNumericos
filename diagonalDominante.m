function [respuesta] = diagonalDominante(matriz)
%DIAGONALDOMINANTE Summary of this function goes here
%   Detailed explanation goes here
[n,m] = size(matriz);
if n == m
    respuesta = true;
    for i=1:n
        a = i
        acumulador = 0;
        for j=1:n
            acumulador = acumulador + abs(matriz(i,j));
        end
        acumulador = acumulador - abs(matriz(i,i));
        diagonal = abs(matriz(i,i));
        if diagonal <= acumulador
            respuesta = false;
            return
        end
    end
else
    respuesta = false
end
end

