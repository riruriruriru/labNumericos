function [resultado]=LUC_R(matrix, b)
    [L, U] = LUC(matrix);
    [n,m] = size(L);
    resultado_parcial = inv(L)*b
    resultado = inv(U)*resultado_parcial