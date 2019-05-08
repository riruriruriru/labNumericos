%definida positiva, diagonal dominante, dispersa, semi definida positiva, sime-trica, etc.
function [c1,c2,c3,c4,c5,c6] = determinarC(matrix) 
c1 = logical(definidaPositiva(matrix)) %def positiva
c2 = logical(definidaSemiPositiva(matrix)) %semi positiva
c3 = logical(definidaNegativa(matrix)) %negativa
c4 = logical(simetrica(matrix)) %simetrica
c5 = logical(dispersa(matrix)) %dispersa
c6 = logical(diagonalDominante(matrix)) %diagonal dominante



