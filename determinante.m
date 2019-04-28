function [respuesta] = determinante(matriz)
    [n,m] = size(matriz);
    if n == m
        if n == 1
            respuesta = matriz;
        else
            respuesta = 0;
            if n == 2
                respuesta = matriz(1,1)*matriz(2,2) - matriz(1,2)*matriz(2,1);
            else
                for i=1:n
                    signo = (-1)^(i+1);
                    otraMatriz = matriz;
                    otraMatriz(:,i) = [];
                    otraMatriz(1,:) = [];
                    respuesta = respuesta + signo*matriz(1,i)*determinante(otraMatriz);
                end
            end
        end
    else
        respuesta = 0;
    end
end