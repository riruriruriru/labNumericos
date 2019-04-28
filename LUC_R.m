function [resultado]=LUC_R(matrix, b)
    [L, U] = LUC(matrix);
    [n,m] = size(L);
    resultado_parcial = inversa(L)*b
    resultado = inversa(U)*resultado_parcial