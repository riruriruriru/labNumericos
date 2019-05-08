function [respuesta] = traspuesta(matriz)
[n,m] = size(matriz);
respuesta = zeros(m,n);
for i=1:n
    respuesta(:,i) = matriz(i,:);
end
end

