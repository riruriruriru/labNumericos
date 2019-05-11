clear all
close all
format long
% se cargan los datos
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
%determinarTipo(A289, b289)
%resultadoD = LUC_D(A289, b289);
%[xDoolittle,eDoolittle,c1D,c2D] = doolittle(A289, b289);
%[xC,eC,c1D,c2D] = cholesky(A289, b289);
%[xG,eG,c1G,c2G] = givens(A289, b289);
% % % 
%%%%%%%%%%%LAB ESPINOZA%%%%%%%%%%%%%%%%%%%%%%%%%
%tic,
%[SolucJaco289, ErrorJaco289, valorJaco289,Cont1Jaco289,Cont2Jaco289] = gaussJacobi(A289, b289, tol);
%tiempoJacobi289 = toc;
%tic,
%[SolucSei289, ErrorSei289, valorSei289,Cont1Sei289,Cont2Sei289] = gaussSeidel(A289, b289, tol);
%tiempoSeidel289 = toc;
%tic,
%tic,
%[SolucJaco1089, ErrorJaco1089, valorJaco1089,Cont1Jaco1089,Cont2Jaco1089] = gaussJacobi(A1089, b1089, tol);
%tiempoJacobi1089 = toc;
%tic,
%[SolucSei1089, ErrorSei1089, valorSei1089,Cont1Sei1089,Cont2Sei1089] = gaussSeidel(A1089, b1089, tol);
%tiempoSeidel1089 = toc;
%tic,

%tic,
%[SolucJaco4225, ErrorJaco4225, valorJaco4225,Cont1Jaco4225,Cont2Jaco4225] = gaussJacobi(A4225, b4225, tol);
%tiempoJacobi4225 = toc;
%tic,
%[SolucSei4225, ErrorSei4225, valorSei4225,Cont1Sei4225,Cont2Sei4225] = gaussSeidel(A4225, b4225, tol);
%tiempoSeidel4225 = toc;
%tic,
%%%%%%%%%%%%%METODOS DIRECTOS LAB ESPINOZA%%%%%%%%%%%%%%%%%%%%
tic,
[resultDoo289, errorDoo289, cont1Doo289,cont2Doo289] = doolittle(A289, b289);
tiempoDoolittle289 = toc;
tic,
[resultHous289, errorHous289, cont1Hous289,cont2Hous289] = Housholder(A289,b289);
tiempoHousholder289 = toc;
tic,
[resultCholesky289, errorCholesky289, contCholesky289] = cholesky(A289, b289);
tiempoCholesky289 = toc;
tic,
[resultQR289, errorQR289, contQR289] = QR(A289, b289);
tiempoQR289 = toc;
tic,
[resultGiv289, errorGiv289, cont1Giv289,cont2Giv289] = givens(A289,b289);
tiempoGivens289 = toc;

tic,
[resultDoo1089, errorDoo1089, cont1Doo1089,cont2Doo1089] = doolittle(A1089, b1089);
tiempoDoolittle1089 = toc;
tic,
[resultHous1089, errorHous1089, cont1Hous1089,cont2Hous1089] = Housholder(A1089,b1089);
tiempoHousholder1089 = toc;
tic,
[resultCholesky1089, errorCholesky1089, contCholesky1089] = cholesky(A1089, b1089);
tiempoCholesky1089 = toc;
tic,
[resultQR1089, errorQR1089, contQR1089] = QR(A1089, b1089);
tiempoQR1089 = toc;
tic,
[resultGiv1089, errorGiv1089, cont1Giv1089,cont2Giv1089] = givens(A1089,b1089);
tiempoGivens1089 = toc;

tic,
[resultDoo4225, errorDoo4225, cont1Doo4225,cont2Doo4225] = doolittle(A4225, b4225);
tiempoDoolittle4225 = toc;
tic,
[resultHous4225, errorHous4225, cont1Hous4225,cont2Hous4225] = Housholder(A4225,b4225);
tiempoHousholder4225 = toc;
tic,
[resultCholesky4225, errorCholesky4225, contCholesky4225] = cholesky(A4225, b4225);
tiempoCholesky4225 = toc;
tic,
[resultQR4225, errorQR4225, contQR4225] = QR(A4225, b4225);
tiempoQR4225 = toc;
%givens se demora demasiado, por lo tanto se comprueba si la matriz es
%dispersa con mas del 70% de sus elementos iguales a 0
%si se cumple esta condicion, entonces se aplica givens sobre 1/4 de la
%matriz
tic,
[resultGiv4225, errorGiv4225, cont1Giv4225,cont2Giv4225] = givens(A4225,b4225);
tiempoGivens4225 = toc;
% %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%GRAFICOS LAB ESPINOZA%%%%%%%%%%%%%%%%%%%%%%
tiemposDir289 = [tiempoDoolittle289, tiempoHousholder289, tiempoCholesky289, tiempoQR289, tiempoGivens289]
tiemposDir1089 = [tiempoDoolittle1089, tiempoHousholder1089, tiempoCholesky1089, tiempoQR1089, tiempoGivens1089]
tiemposDir4225 = [tiempoDoolittle4225, tiempoHousholder4225, tiempoCholesky4225, tiempoQR4225, tiempoGivens4225]
%tiempos289 = [tiempoJacobi289, tiempoSeidel289];
%tiempos1089 = [tiempoJacobi1089,tiempoSeidel1089];
%tiempos4225 = [tiempoJacobi4225,tiempoSeidel4225];
graphTimeDir(tiemposDir289,'Matriz 289x289','Doolittle','Housholder','Cholesky','QR','Givens');
graphTimeDir(tiemposDir1089,'Matriz 1089x1089','Doolittle','Housholder','Cholesky','QR','Givens');
graphTimeDir(tiemposDir4225,'Matriz 4225x4225','Doolittle','Housholder','Cholesky','QR','Givens');

graficarValores2(resultDoo289,resultHous289,resultCholesky289, resultQR289,resultGiv289);
graficarValores2(resultDoo1089,resultHous1089,resultCholesky1089, resultQR1089,resultGiv1089);
graficarValores2(resultDoo4225,resultHous4225,resultCholesky4225, resultQR4225,resultGiv4225);
%graphTimeJacobiSeidel(tiempos289,'Matriz 289x289','Jacobi','Seidel');
%graphTimeJacobiSeidel(tiempos1089,'Matriz 1089x1089','Jacobi','Seidel');
%graphTimeJacobiSeidel(tiempos4225,'Matriz 4225x4225','Jacobi','Seidel');
%graficarValoresIt(SolucJaco289, SolucSei289, 'Aproximaciones matriz 289x289');
%graficarValoresIt(SolucJaco1089, SolucSei1089, 'Aproximaciones matriz 1089x1089');
%graficarValoresIt(SolucJaco4225, SolucSei4225, 'Aproximaciones matriz 4225x4225');
%graficarErrores2(ErrorJaco289, ErrorSei289,"Errores matriz 289x289");
%graficarErrores2(ErrorJaco1089, ErrorSei1089,"Errores matriz 1089x1089");
%graficarErrores2(ErrorJaco4225, ErrorSei4225,"Errores matriz 4225x4225");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tiempo1 = [tiempoJ1,tiempoS1,tiempoD1,tiempoHou1,tiempoC1,tiempoQ1,tiempoGiv1];
% Espacial1M1 = [Cont1JacoM1,Cont1SeiM1,Cont1DooM1,Cont1HouM1,Cont1ChoM1,Cont1QRM1,Cont1GivM1];
% Espacial2M1 = [Cont2JacoM1,Cont2SeiM1,Cont2DooM1,Cont2HouM1,Cont2ChoM1,Cont2QRM1,Cont2GivM1];
% ErrorDirecto1 = [ErrorDooM1,ErrorHouM1, ErrorChoM1,ErrorQRM1, ErrorGivM1];

% graficarValorSG(valorDooM1,valorChoM1, valorQRM1,valorHouM1)
% 
% 
%1089

% A2 = load('A1089.dat');
% b2 = load('b1089.dat');
% 
% tic,
% [SolucJacoM2, ErrorJacoM2, valorJacoM2,Cont1JacoM2,Cont2JacoM2] = gaussJacobi(A2, b2, error);
% tiempoJ2 = toc;
% tic,
% [SolucSeiM2, ErrorSeiM2, valorSeiM2,Cont1SeiM2,Cont2SeiM2] = gaussSeidel(A2, b2, error);
% tiempoS2 = toc;
% tic,
% [valorDooM2, ErrorDooM2, Cont1DooM2,Cont2DooM2] = doolittle(A2, b2);
% tiempoD2 = toc;
% tic,
% [valorHouM2, ErrorHouM2, Cont1HouM2,Cont2HouM2] = Housholder(A2,b2);
% tiempoHou2 = toc;
% tic,
% [valorChoM2, ErrorChoM2, Cont1ChoM2,Cont2ChoM2] = cholesky(A2, b2);
% tiempoC2 = toc;
% tic,
% [valorQRM2, ErrorQRM2, Cont1QRM2,Cont2QRM2] = QR(A2, b2);
% tiempoQ2 = toc;
% tic,
% [valorGivM2, ErrorGivM2, Cont1GivM2,Cont2GivM2] = givens(A2,b2);
% tiempoGiv2 = toc;
% % 
% tiempo2 = [tiempoJ2,tiempoS2,tiempoD2,tiempoHou2,tiempoC2,tiempoQ2,tiempoGiv2];
% Espacial1M2 = [Cont1JacoM2,Cont1SeiM2,Cont1DooM2,Cont1HouM2,Cont1ChoM2,Cont1QRM2,Cont1GivM2];
% Espacial2M2 = [Cont2JacoM2,Cont2SeiM2,Cont2DooM2,Cont2HouM2,Cont2ChoM2,Cont2QRM2,Cont2GivM2];
% ErrorDirecto2 = [ErrorDooM2,ErrorHouM2, ErrorChoM2,ErrorQRM2, ErrorGivM2];
% graficarValoresIt(SolucJacoM2, SolucSeiM2, 'Aproximaciones sistema 1089');
% graficarValores2(valorDooM2,valorChoM2, valorQRM2,valorGivM2,valorHouM2);
% graficarErrores2(ErrorJacoM2, ErrorSeiM2);

%4225
% % 
%A3 = load('A4225.dat');
%b3 = load('b4225.dat');

% 
% tic,
% [SolucJacoM3, ErrorJacoM3, valorJacoM3,Cont1JacoM3,Cont2JacoM3] = gaussJacobi(A3, b3, error);
% tiempoJ3 = toc;
% tic,
% [SolucSeiM3, ErrorSeiM3, valorSeiM3,Cont1SeiM3,Cont2SeiM3] = gaussSeidel(A3, b3, error);
% tiempoS3 = toc;
% tic,
% [valorDooM3, ErrorDooM3, Cont1DooM3,Cont2DooM3] = doolittle(A3, b3);
% tiempoD3 = toc;
% tic,
% [valorHouM3, ErrorHouM3, Cont1HouM3,Cont2HouM3] = Housholder(A3,b3);
% tiempoHou3 = toc;
% tic,
% [valorChoM3, ErrorChoM3, Cont1ChoM3,Cont2ChoM3] = cholesky(A3, b3);
% tiempoC3 = toc;
% tic,
% [valorQRM3, ErrorQRM3, Cont1QRM3,Cont2QRM3] = QR(A3, b3);
% tiempoQ3 = toc;
%tic,
%[valorGivM3, ErrorGivM3, Cont1GivM3,Cont2GivM3] = givens(A3,b3);
%tiempoGiv3 = toc;
% % % 
%tiempo3 = [tiempoJ3,tiempoS3,tiempoD3,tiempoHou3,tiempoC3,tiempoQ3];
%Espacial1M3 = [Cont1JacoM3,Cont1SeiM3,Cont1DooM3,Cont1HouM3,Cont1ChoM3,Cont1QRM3];
%Espacial2M3 = [Cont2JacoM3,Cont2SeiM3,Cont2DooM3,Cont2HouM3,Cont2ChoM3,Cont2QRM3];
%ErrorDirecto3 = [ErrorDooM3,ErrorHouM3, ErrorChoM3,ErrorQRM3];
% graficarValoresIt(SolucJacoM3, SolucSeiM3, 'Aproximaciones sistema 4225');
% graficarValorSG(valorDooM3,valorChoM3, valorQRM3,valorHouM3);
% graficarErrores2(ErrorJacoM3, ErrorSeiM3);

%Ahora tenemos que guardar las imagenes que creamos:

%Ingresamos a la carpeta para guardar las imagenes
% cd 'Lab 1'/
% cd 'Imagenes MEC'/;

%Guardamos los resultados de la primera matriz 
%h = figure(1);
% saveas(h, 'ResultadoValoresIteraciones1.png');
% h = figure(2);
% saveas(h, 'ResultadoDeValores1.png');
% h = figure(3);
% saveas(h, 'ErroresMatriz1Ite.png');
% % % Guardamos los resultados de la segunda matriz
% h = figure(1);
% saveas(h, 'ResultadoValoresIteraciones2.png');
% h = figure(2);
% saveas(h, 'ResultadoDeValores2.png');
% h = figure(3);
% saveas(h, 'ErroresMatriz2Ite.png');
% % Guardamos los resultados de la tercera matriz
% h = figure(7);
% saveas(h, 'ResultadoValoresIteraciones3.png');
% h = figure(8);
% saveas(h, 'ResultadoDeValores3.png');
% h = figure(9);
% saveas(h, 'ErroresMatriz3Ite.png');

