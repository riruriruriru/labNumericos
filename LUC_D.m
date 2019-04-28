function [resultado]=LUC_D(matrix, b)
    [L, U] = LUD(matrix);
    [n,m] = size(L);
    resultado_parcial = inversa(L)*b
    resultado = inversa(U)*resultado_parcial