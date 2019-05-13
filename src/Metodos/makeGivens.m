function [G,contGiv] = makeGivens(m,i,j,xi,xj)
%CONTRUIRGIVENS Summary of this function goes here
%   Detailed explanation goes here
    contGiv = 0;
    if abs(xj)>abs(xi)
        t = xi./xj;
        z = sqrt(1.+t.*t);
        s = 1./z;
        c = t.*s;
        contGiv = contGiv +8;
    else
        t = xj./xi;
        z = sqrt(1.+t.*t);
        c = 1./z;
        s = t.*c;
        contGiv = contGiv +8;
    end
    G = eye(m);
    G(i,i) = c;
    G(i,j) = c;
    G(i,j) = -s;
    G(j,i) = s;
    contGiv = contGiv +4+(m*m);
end