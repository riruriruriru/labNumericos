%close all
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
%%%%%%%%%%METODOS ITERATIVOS%%%%%%%%%%%%%%%%%%%%%%%%%
tic,
[SolucJaco289, ErrorJaco289, contJaco289] = gaussJacobi(A289, b289, tol);
tiempoJacobi289 = toc;
tic,
[SolucSei289, ErrorSei289, contSei289] = gaussSeidel(A289, b289, tol);
tiempoSeidel289 = toc;
tic,
[SolucJaco1089, ErrorJaco1089, contJaco1089] = gaussJacobi(A1089, b1089, tol);
tiempoJacobi1089 = toc;
tic,
[SolucSei1089, ErrorSei1089, contSei1089] = gaussSeidel(A1089, b1089, tol);
tiempoSeidel1089 = toc;
tic,
[SolucJaco4225, ErrorJaco4225, contJaco4225] = gaussJacobi(A4225, b4225, tol);
tiempoJacobi4225 = toc;
tic,
[SolucSei4225, ErrorSei4225, contSei4225] = gaussSeidel(A4225, b4225, tol);
tiempoSeidel4225 = toc;
valoresFinalesJ289 = SolucJaco289(:,[end]);
valoresFinalesS289 = SolucSei289(:,[end]);
valoresFinalesJ1089 = SolucJaco1089(:,[end]);
valoresFinalesS1089 = SolucSei1089(:,[end]);
valoresFinalesJ4225 = SolucJaco4225(:,[end]);
valoresFinalesS4225 = SolucSei4225(:,[end]);
%%%%%%%%%%%%%%GRAFICOS METODOS ITERATIVOS%%%%%%%%%%%%%%%%%%%%
tiempos289 = [tiempoJacobi289, tiempoSeidel289];
tiempos1089 = [tiempoJacobi1089,tiempoSeidel1089];
tiempos4225 = [tiempoJacobi4225,tiempoSeidel4225];
graphTimeJacobiSeidel(tiempos289,'Matriz 289x289','Jacobi','Seidel',1);
graphTimeJacobiSeidel(tiempos1089,'Matriz 1089x1089','Jacobi','Seidel',2);
graphTimeJacobiSeidel(tiempos4225,'Matriz 4225x4225','Jacobi','Seidel',3);
graficarResultadosIterativos(SolucJaco289, SolucSei289, 'Aproximaciones matriz 289x289',4);
graficarResultadosIterativos(SolucJaco1089, SolucSei1089, 'Aproximaciones matriz 1089x1089',5);
graficarResultadosIterativos(SolucJaco4225, SolucSei4225, 'Aproximaciones matriz 4225x4225',6);
graficarErrorIterativos(ErrorJaco289, ErrorSei289,"Errores matriz 289x289",7);
graficarErrorIterativos(ErrorJaco1089, ErrorSei1089,"Errores matriz 1089x1089",8);
graficarErrorIterativos(ErrorJaco4225, ErrorSei4225,"Errores matriz 4225x4225",9);
graph2Dir(valoresFinalesJ289, valoresFinalesS289, "Jacobi","Seidel","Aproximaciones ultima iteracion 289x289",10);
graph2Dir(valoresFinalesJ1089, valoresFinalesS1089, "Jacobi","Seidel","Aproximaciones ultima iteracion 1089x1089",11);
graph2Dir(valoresFinalesJ4225, valoresFinalesS4225, "Jacobi","Seidel","Aproximaciones ultima iteracion 4225x4225",12);
%%%%%%%%%%%%%METODOS DIRECTOS LAB ESPINOZA%%%%%%%%%%%%%%%%%%%%
%% Directos

tic,
[resultDoo289, contDoo289] = doolittle(A289, b289);
tiempoDoolittle289 = toc;
tic,
[resultHous289,contHous289] = Householder(A289,b289);
tiempoHousholder289 = toc;
tic,
[resultCholesky289, contCholesky289] = cholesky(A289, b289);
tiempoCholesky289 = toc;
tic,
[resultQR289, contQR289] = QR(A289, b289);
tiempoQR289 = toc;
tic,
[resultGiv289, contGiv289] = givens(A289,b289);
tiempoGivens289 = toc;

tic,
[resultDoo1089, contDoo1089] = doolittle(A1089, b1089);
tiempoDoolittle1089 = toc;
tic,
[resultHous1089,contHous1089] = Householder(A1089,b1089);
tiempoHousholder1089 = toc;
tic,
[resultCholesky1089, contCholesky1089] = cholesky(A1089, b1089);
tiempoCholesky1089 = toc;
tic,
[resultQR1089, contQR1089] = QR(A1089, b1089);
tiempoQR1089 = toc;
tic,
[resultGiv1089, contGiv1089] = givens(A1089,b1089);
tiempoGivens1089 = toc;


tic,
[resultDoo4225, contDoo4225] = doolittle(A4225, b4225);
tiempoDoolittle4225 = toc;
tic,
[resultHous4225, contHous4225] = Householder(A4225,b4225);
tiempoHousholder4225 = toc;
tic,
[resultCholesky4225, contCholesky4225] = cholesky(A4225, b4225);
tiempoCholesky4225 = toc;
tic,
[resultQR4225, contQR4225] = QR(A4225, b4225);
tiempoQR4225 = toc;
tic,
[resultGiv4225, contGiv4225] = givens(A4225,b4225);
tiempoGivens4225 = toc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%GRAFICOS METODOS DIRECTOS%%%%%%%%%%%%%%%%%%%%%%
tiemposDir289 = [tiempoDoolittle289, tiempoHousholder289, tiempoCholesky289, tiempoQR289, tiempoGivens289];
tiemposDir1089 = [tiempoDoolittle1089, tiempoHousholder1089, tiempoCholesky1089, tiempoQR1089,tiempoGivens1089];
tiemposDir4225 = [tiempoDoolittle4225, tiempoHousholder4225, tiempoCholesky4225, tiempoQR4225,tiempoGivens4225];

graphTimeDir(tiemposDir289,'Matriz 289x289','Doolittle','Housholder','Cholesky','QR','Givens',13);
graphTimeDir(tiemposDir1089,'Matriz 1089x1089','Doolittle','Housholder','Cholesky','QR','Givens',14);
graphTimeDir(tiemposDir4225,'Matriz 4225x4225','Doolittle','Housholder','Cholesky','QR','Givens',15);

graficarDirectosConGivens(resultDoo289,resultHous289,resultCholesky289, resultQR289,resultGiv289,16);
graficarDirectosConGivens(resultDoo4225,resultHous4225,resultCholesky4225, resultQR4225,resultGiv4225,17);
graficarDirectosConGivens(resultDoo1089,resultHous1089,resultCholesky1089, resultQR1089,resultGiv1089,18);


%%Errores relativos metodos iterativos vs directos
seidelVS289 = [resultCholesky289, resultDoo289, resultGiv289, valoresFinalesJ289, resultHous289, resultQR289];
seidelVS1089 = [resultCholesky1089, resultDoo1089, resultGiv1089, valoresFinalesJ1089, resultHous1089, resultQR1089];
seidelVS4225 = [resultCholesky4225, resultDoo4225, resultGiv4225, valoresFinalesJ4225, resultHous4225, resultQR4225];
matrizErrores = construirMatrizError(valoresFinalesS289,valoresFinalesS1089,valoresFinalesS4225,seidelVS289,seidelVS1089,seidelVS4225);