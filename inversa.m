function [respuesta] = inversa(matriz)
    [n,m] = size(matriz);
    if n == m
        if determinante(matriz)
            respuesta = (1/determinante(matriz))*traspuesta(adjunta(matriz));
        else
            respuesta = "The determinant of the matrix must not be equal to 0"
        end
    else
        respuesta = "Matrix must be square";
end

