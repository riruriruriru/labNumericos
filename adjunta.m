function [respuesta] = adjunta(matriz)
signo = 1;
[n,m] = size(matriz);
respuesta = matriz;
if n == m
    for i=1:n
        for j=1:m
            otraMatriz = matriz;
            otraMatriz(:,j) = [];
            otraMatriz(i,:) = [];
            respuesta(i,j)= signo*determinante(otraMatriz);
            signo = signo * -1;
        end
    end
end
end

