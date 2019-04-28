function [respuesta] = simetrica(matriz)
    [n,m] = size(matriz);
    respuesta = false;
    if n == m
        matrizTraspuesta = traspuesta(matriz)
        if matrizTraspuesta == matriz;
            respuesta = true;
        end
    end
end

