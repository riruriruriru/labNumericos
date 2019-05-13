%%%Resolución sistema no lineal
tol = 10^-18; %Tolerancia
iter = 500;
x0 = [0;0;0];
[errores, raices] = newtonRaphsonM(x0, tol, iter);
graphResultsNewtonRaphson(raices');
graphErrorNewtonRaphson(errores');
