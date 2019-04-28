function [respuesta] = definidaPositiva(matriz)
%DEFINIDAPOSITIVA Summary of this function goes here
%   Detailed explanation goes here
[n,m] = size(matriz);
respuesta = false;
if n == m
    otraMatriz = matriz
    respuesta = true;
    for i=1:n
        [n2,m2] = size(otraMatriz);
        esDeterminante = determinante(otraMatriz)
        if esDeterminante <= 0
            respuesta = false;
            break;
        end
        otraMatriz(n2,:) = [];
        otraMatriz(:,m2) = [];
    end
end
end

