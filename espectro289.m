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
u = linsolve(A,b);

%se hace el grafico
[ux,uy] = pdegrad(p0,t0,u); % Calculate gradient
ugrad = [ux;uy];
h = pdeplot(p0,e0,t0,'xydata',u,'zdata',u,...
    'colormap','jet','mesh','on','flowdata',ugrad);
aa = [2,-3,1;-4,9,2;6,12,-2]
bb = [3;4;-2]
resultado = LUC_R(A, b)
resultado2 = LUC_D(A, b)
variable = 0
if A*resultado == b
    variable = 1
end
variable2 = 0
if round(resultado,3) == round(resultado2,3)
    variable2 = 1
end
[gaussSeidel,i1,e1] = gauss_seidel(A,b,500,0)
[gaussJacobi,i1,e1] = gauss_jacobi(A,b,500,0)
variable3 = 0
if round(gaussSeidel,3) == round(gaussJacobi,3)
    variable3 = 1
end

