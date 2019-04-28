a = [21 12 7 0; 8 18 5 4; -5 3 200 20; 1 0 2 7];
b = [1 2 3 4; 2 7 1 7; 3 1 3 6; 4 7 6 5];
c = adjunta(a);

syms f(x) g(x) h(x,y)

f(x) = x^2+1;
g(x) = sin(x);
h(x,y) = x^2 + sin(y);
i(x,y) = y^2 + sin(x);
j(x,y) = (y^2)*sin(x);

syms z
valores = [1,z];
derivada(j,0.0001,1,valores)
%5000*z^2*sin(10001/10000) - 5000*z^2*sin(9999/10000) =
%(38020394676875*z^2)/70368744177664 = 0.5403*z^2


k = diff(j);
k(1,z)
%z^2*cos(1) = 0.5403*z^2

