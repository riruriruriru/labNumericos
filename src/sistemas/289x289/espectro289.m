% se cargan los datos
A = load('A289.dat');
b = load('b289.dat');
p= load('nodos.dat'); %289x2
e = load('fronteras.dat');%64x7
t = load('elementos.dat');%512 x 4
% se trasponen los nodos, frontera y elementos
p0 = p'; %2x289
e0 = e';%7x64
t0 = t';%4 x 512 
u = linsolve(A,b)

%se hace el grafico
[ux,uy] = pdegrad(p0,t0,u); % Calculate gradient
ugrad = [ux;uy];
h = pdeplot(p0,e0,t0,'xydata',u,'zdata',u,...
    'colormap','jet','mesh','on','flowdata',ugrad)