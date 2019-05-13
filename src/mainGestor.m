format long
tol = 10^-18;%buscar error minimo maquina, 10^-18 cercano al tamanio de un float double en matlab, 64 bits
addpath(genpath('..\src\'));
%Matriz de 289x289
A289 = load('src\sistemas\289x289\A289.dat');
b289 = load('src\sistemas\289x289\b289.dat');
%Matriz de 289x289
A1089 = load('src\sistemas\1089x1089\A1089.dat');
b1089 = load('src\sistemas\1089x1089\b1089.dat');
%Matriz de 289x289
A4225 = load('src\sistemas\4225x4225\A4225.dat');
b4225 = load('src\sistemas\4225x4225\b4225.dat');
% %%%%%%%%%%%%%%%%%%%%APLICACION ALGORITMO%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tic,
% [r1,i1,n] = determinarTipo(A289, b289,19);
% tiempoAlgoritmo289 = toc;
% tic,
% [r2,i2,n2] = determinarTipo(A4225, b4225,n);
% tiempoAlgoritmo4225 = toc;
% tic,
% [r3,i3,n3] = determinarTipo(A1089, b1089,n2);
% tiempoAlgoritmo1089 = toc;
tic,
determinarC(A289);
t289 = toc;
tic,
determinarC(A1089);
t1089 = toc;
tic,
determinarC(A4225);
t4225 = toc;
graphTimeAlgoritmo([t289,t1089,t4225],'Tiempo de verificaci�n de propiedades','289x289','1089x1089','4225x4225',n3+2);
%graphTimeAlgoritmo([tiempoAlgoritmo289,tiempoAlgoritmo1089,tiempoAlgoritmo4225],'Tiempo total aplicaci�n gestor','289x289','1089x1089','4225x4225',n3+1);
%graphTimeAlgoritmo([r1,r2,r3],'Tiempo de verificaci�n de propiedades','289x289','1089x1089','4225x4225',n3+2);