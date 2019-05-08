syms x y z
f = x^2+y-37;
g = x-y^2-5;
h = x+y+z-3;
x0 = [0;0;0];
F = [f,g,h];
variables = [x,y,z]';
%[sistema2, errorNM3, contador1NewM3,contador2NewM3] = newtonRaphsonMult2(F, x0, 0, 15);
[errores, raices] = newtonRaphsonM(x0, 10^-15, 500);
graphResultsNewtonRaphson(raices');
graphErrorNewtonRaphson(errores');
