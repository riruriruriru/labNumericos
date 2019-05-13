function [respuesta] = definidaSemiPositiva(matriz)
[n,m] = size(matriz);
respuesta = false;
if n == m
    otraMatriz = matriz;
    respuesta = true;
    for i=1:n-1
        [n2,m2] = size(otraMatriz);
        esDeterminante = det(otraMatriz);
        if esDeterminante < 0
            respuesta = false;
            break;
        end
        otraMatriz(n2,:) = [];
        otraMatriz(:,m2) = [];
    end
end
end
