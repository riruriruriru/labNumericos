function [respuesta] = definidaNegativa(matriz)
[n,m] = size(matriz);
respuesta = false;
if n == m
    otraMatriz = matriz
    respuesta = true;
    for i=1:n
        [n2,m2] = size(otraMatriz);
        esDeterminante = determinante(otraMatriz)
        signo = (-1)^n2;
        if signo == 1
            if esDeterminante <= 0
                respuesta = false;
                break;
            end
        else
            if esDeterminante >= 0
                respuesta = false;
                break;
            end
        end
        otraMatriz(n2,:) = [];
        otraMatriz(:,m2) = [];
    end
end
end