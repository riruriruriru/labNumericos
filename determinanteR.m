function [resultado] = determinanteR(matriz,i)
    [n,m] = size(matriz);
    resultado = 0;
    if n == m
            if n == 2
                resultado = matriz(1,1)*matriz(2,2) - matriz(1,2)*matriz(2,1);
            elseif n == 1
                resultado = matriz
            else
                for i=1:n
                    sign = (-1)^(i+1);
                    newMatrix = matriz;
                    newMatrix(:,i) = [];
                    newMatrix(1,:) = [];
                    resultado= resultado+matriz(1,i)*sign*determinanteR(newMatrix, i);
                end
            end
       
    end
end