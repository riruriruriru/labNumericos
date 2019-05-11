close all
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
%%%%%%%%%%%METODOS ITERATIVOS%%%%%%%%%%%%%%%%%%%%%%%%%
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
valoresFinales289 = [SolucJaco289(:,[end]),SolucSei289(:,[end])];
valoresFinales1089 = [SolucJaco1089(:,[end]),SolucSeil089(:,[end])];
valoresFinales4225 = [SolucJaco4225(:,[end]),SolucSei4225(:,[end])];
%%%%%%%%%%%%%%GRAFICOS METODOS ITERATIVOS%%%%%%%%%%%%%%%%%%%%
tiempos289 = [tiempoJacobi289, tiempoSeidel289];
tiempos1089 = [tiempoJacobi1089,tiempoSeidel1089];
tiempos4225 = [tiempoJacobi4225,tiempoSeidel4225];
graphTimeJacobiSeidel(tiempos289,'Matriz 289x289','Jacobi','Seidel');
graphTimeJacobiSeidel(tiempos1089,'Matriz 1089x1089','Jacobi','Seidel');
graphTimeJacobiSeidel(tiempos4225,'Matriz 4225x4225','Jacobi','Seidel');
graficarResultadosIterativos(SolucJaco289, SolucSei289, 'Aproximaciones matriz 289x289');
graficarResultadosIterativos(SolucJaco1089, SolucSei1089, 'Aproximaciones matriz 1089x1089');
graficarResultadosIterativos(SolucJaco4225, SolucSei4225, 'Aproximaciones matriz 4225x4225');
graficarErrorIterativos(ErrorJaco289, ErrorSei289,"Errores matriz 289x289");
graficarErrorIterativos(ErrorJaco1089, ErrorSei1089,"Errores matriz 1089x1089");
graficarErrorIterativos(ErrorJaco4225, ErrorSei4225,"Errores matriz 4225x4225");
%%%%%%%%%%%%%METODOS DIRECTOS LAB ESPINOZA%%%%%%%%%%%%%%%%%%%%
tic,
[resultDoo289, contDoo289] = doolittle(A289, b289);
tiempoDoolittle289 = toc;
tic,
[resultHous289,contHous289] = Housholder(A289,b289);
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
[resultHous1089,contHous1089] = Housholder(A1089,b1089);
tiempoHousholder1089 = toc;
tic,
[resultCholesky1089, contCholesky1089] = cholesky(A1089, b1089);
tiempoCholesky1089 = toc;
tic,
[resultQR1089, contQR1089] = QR(A1089, b1089);
tiempoQR1089 = toc;
%givens se demora demasiado, por lo tanto se comprueba si la matriz es
%dispersa con mas del 70% de sus elementos iguales a 0
%si se cumple esta condicion, entonces se aplica givens sobre 1/4 de la
%matriz
bool = dispersa70(A1089);
if bool == 1
nuevoAncho = floor(1089/4);
AGivens1089 = A1089(:,1:nuevoAncho);
tic,
[resultGiv1089, contGiv1089] = givens(AGivens1089,b1089);
tiempoGivens1089 = toc;
else
    tic,
    [resultGiv1089, contGiv1089] = givens(A1089,b1089);
    tiempoGivens1089 = toc;
end

tic,
[resultDoo4225, contDoo4225] = doolittle(A4225, b4225);
tiempoDoolittle4225 = toc;
tic,
[resultHous4225, contHous4225] = Housholder(A4225,b4225);
tiempoHousholder4225 = toc;
tic,
[resultCholesky4225, contCholesky4225] = cholesky(A4225, b4225);
tiempoCholesky4225 = toc;
tic,
[resultQR4225, contQR4225] = QR(A4225, b4225);
tiempoQR4225 = toc;
%givens se demora demasiado, por lo tanto se comprueba si la matriz es
%dispersa con mas del 70% de sus elementos iguales a 0
%si se cumple esta condicion, entonces se aplica givens sobre 1/6 de la
%matriz
bool = dispersa70(A4225);
if bool == 1
nuevoAncho = floor(4225/6);
AGivens4225 = A4225(:,1:nuevoAncho);
tic,
[resultGiv4225, contGiv4225] = givens(AGivens4225,b4225);
tiempoGivens4225 = toc;
else
    tic,
    [resultGiv4225, contGiv4225] = givens(A4225,b4225);
    tiempoGivens4225 = toc;
end
% %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%GRAFICOS METODOS DIRECTOS%%%%%%%%%%%%%%%%%%%%%%
tiemposDir289 = [tiempoDoolittle289, tiempoHousholder289, tiempoCholesky289, tiempoQR289, tiempoGivens289];
tiemposDir1089 = [tiempoDoolittle1089, tiempoHousholder1089, tiempoCholesky1089, tiempoQR1089, tiempoGivens1089];
tiemposDir4225 = [tiempoDoolittle4225, tiempoHousholder4225, tiempoCholesky4225, tiempoQR4225, tiempoGivens4225];

graphTimeDir(tiemposDir289,'Matriz 289x289','Doolittle','Housholder','Cholesky','QR','Givens');
graphTimeDir(tiemposDir1089,'Matriz 1089x1089','Doolittle','Housholder','Cholesky','QR','Givens');
graphTimeDir(tiemposDir4225,'Matriz 4225x4225','Doolittle','Housholder','Cholesky','QR','Givens');

graficarDirectosConGivens(resultDoo289,resultHous289,resultCholesky289, resultQR289,resultGiv289);
graficarResultadosDirSinGivens(resultDoo1089,resultHous1089,resultCholesky1089, resultQR1089);
graficarDirectosConGivens(resultDoo4225,resultHous4225,resultCholesky4225, resultQR4225);
graficarResultadosDirSinGivens(resultDoo4225,resultHous4225,resultCholesky4225, resultQR4225);
graficarDirectosConGivens(resultDoo1089,resultHous1089,resultCholesky1089, resultQR1089);

%%%%%%%%%%%%%%%%%%%%APLICACION ALGORITMO%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic,
determinarTipo(A289, b289);
tiempoAlgoritmo289 = toc;
tic,
determinarTipo(A4225, b4225);
tiempoAlgoritmo4225 = toc;
tic,
determinarTipo(A1089, b1089);
tiempoAlgoritmo1089 = toc;
graphTimeAlgoritmo([tiempoAlgoritmo289,tiempoAlgoritmo1089,tiempoAlgoritmo4225],'Matriz 289x289, 1089x1089 y 4225x4225','289x289','1089x1089','4225x4225');


