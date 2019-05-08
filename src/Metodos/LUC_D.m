function [resultado]=LUC_D(matrix, b)
    [L, U] = LUD(matrix);
    [n,m] = size(L);
    resultado_parcial = inv(L)*b
    resultado = inv(U)*resultado_parcial