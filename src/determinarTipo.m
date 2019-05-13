function [resultado,iter,nn] = determinarTipo(A, b,n)
%caracteristicas
%c1 = logical(definidaPositiva(matrix)) %def positiva
%c2 = logical(definidaSemiPositiva(matrix)) %semi positiva
%c3 = logical(definidaNegativa(matrix)) %negativa
%c4 = logical(simetrica(matrix)) %simetrica
%c5 = logical(dispersa(matrix)) %dispersa
%c6 = logical(diagonalDominante(matrix)) %diagonal dominante
tic,
[c1,c2,c3,c4,c5,c6] = determinarC(A);
resultado = toc;
nn = n;
tol = 10^-18;
iter = 0;
%LU no cholesky: matrices cuadradas e inversa->determinante distinto de 0
%definida positiva y simetrica: cholesky
%diagonal dominante: gauss jacobi y gauss seidel
%metodos directos: matrices < a 300
%metodos iterativos (gauss seidel y jacobi): matrices grandes, > 300 y dispersas
%matrices cuadradas, grandes y no dispersas: QR
%metodo housholder: matriz simetrica
%metodo givens: matriz dispersa y cuadrada
[n,m] = size(A);
if n ~= m
    if n <= 300 && m <= 300
        string = 'Matriz no es cuadrada y pequeña, solo se resolverá con método QR, Givens y Householder';
        disp(string)
        [resultGiv, contGiv] = givens(A,b);
        [resultQR, contQR] = QR(A,b);
        [resultHous, contHous] = Householder(A,b);
        resultado = [resultGiv,resultQR, resultHous];
        iter = contGiv+contQR+contHous;
        nn = nn+1;
        graph3Dir(resultGiv,resultQR,resultHous, "Givens","QR","Householder","Resultados matrices no cuadradas",nn);
        return
    end
else
    string = 'Matriz cuadrada';
    disp(string)
    if n>300
        string = 'Matriz se considera grande, se decidirá entre métodos iterativos: gauss seidel y gauss jacobi, además del método directo QR';
        disp(string)
        if c5 == 1 %matriz dispersa
            if c6 == 1%diagonal dominante
                %aplicar gauss seidel y jacobi
                string = 'Matriz tiene diagonal dominante. Se resolverá con método gauss seidel y gauss jacobi';
                disp(string)
                [SolucJaco, ErrorJaco, contJaco] = gaussJacobi(A, b, tol);
                [SolucSei, ErrorSei, contSei] = gaussSeidel(A, b, tol);
                iter = contJaco+contSei;
                nn = nn+1;
                graficarResultadosIterativos(SolucJaco, SolucSei, 'Aproximaciones matriz grande, dispersa y diagonal dominante',nn);
                nn = nn+1;
                graficarErrorIterativos(ErrorJaco, ErrorSei,"Errores matriz grande, dispersa y diagonal dominante",nn);

            end
        end
    else
        string = 'Matriz se considera pequeña, se decidirá entre métodos directos';
        disp(string)
        if c1 == 1 && c4 == 1 && c5 == 1 && c6 == 1
            string = 'Matriz simetrica, definida positiva, dispersa y diagonal dominante. Se resolverá con cholesky, givens, LU doolittle y metodos iterativos';
            disp(string)
            [resultCholesky,contCholesky]=cholesky(A, b);
            [resultDoo,contDoo] = doolittle(A, b); 
            [resultGivens,contGivens] = givens(A,b);
            nn = nn+1;
            graph3Dir(resultCholesky,resultGivens,resultDoo, "Cholesky","Givens","Doolittle","Resultados matrices positivas, dispersas, simetricas y diagonal dominante",nn);
            [SolucJaco, ErrorJaco, contJaco] = gaussJacobi(A, b, tol);
            [SolucSei, ErrorSei, contSei] = gaussSeidel(A, b, tol);
            iter = contJaco+contSei+contGivens+contDoo+contCholesky;
            nn = nn+1;
            graficarResultadosIterativos(SolucJaco, SolucSei, 'Aproximaciones matriz simetrica, diagonal dominante, positiva y dispersa',nn);
            nn = nn+1;
            graficarErrorIterativos(ErrorJaco, ErrorSei,"Errores matriz simetrica, diagonal dominante, positiva y dispersa",nn);
            %agregar iterativos
        elseif c1 == 1 && c4 == 1 && c5 == 1 && c6 == 0
            string = 'Matriz simetrica, definida positiva y dispersa. Se resolverá con cholesky, givens y LU doolittle';
            disp(string)
            [resultCholesky,contCholesky]=cholesky(A, b);
            [resultDoo,contDoo] = doolittle(A, b); 
            [resultGivens,contGivens] = givens(A,b);
            iter = contGivens+contDoo+contCholesky;
            nn = nn+1;
            graph3Dir(resultCholesky,resultGivens,resultDoo, "Cholesky","Givens","Doolittle","Resultados matrices positivas, dispersas, simetricas",nn);
       
        elseif c4 == 1 && c1 ~= 1 && c5 == 1 && c6 == 0
            string = 'Matriz simetrica, dispersa y no definida positiva. Se resolverá con housholder, givens, QR y LU doolittle';
            disp(string)
            [resultQR,contQR]=QR(A, b);
            [resultDoo,contDoo] = doolittle(A, b); 
            [resultGivens,contGivens] = givens(A,b);
            [resultHous,contHous] = Householder(A,b);
            iter = contGivens+contDoo+contQR+contHous;
            nn = nn+1;
            graph4Dir(resultQR,resultGivens,resultDoo,resultHous, "QR","Givens","Doolittle","Householder","Resultados simetricas y dispersas",nn);
        elseif c6 == 1 && c5 == 1   %dispersa y diagonal dominante
            string = 'Matriz dispersa y diagonal dominante, se resolvera con métodos iterativos';
            disp(string)
            [SolucJaco, ErrorJaco, contJaco] = gaussJacobi(A, b, tol);
            [SolucSei, ErrorSei, contSei] = gaussSeidel(A, b, tol);
            iter = contJaco+contSei;
            nn = nn+1;
            graficarResultadosIterativos(SolucJaco, SolucSei, 'Aproximaciones matriz pequeña, dispersa y diagonal dominante',nn);
            nn = nn+1;
            graficarErrorIterativos(ErrorJaco, ErrorSei,"Errores matriz pequeña, dispersa y diagonal dominante",nn);
        elseif c5 ==0 %matriz no dispersa
            %aplicar housholder y QR
            string = 'Matriz no dispersa. Se resolverá con housholder y QR';
            disp(string)
            [resultQR,contQR]=QR(A, b); 
            [resultHous,contHous] = Householder(A,b);
            iter = contQR+contHous;
            nn = nn+1;
            graph2Dir(resultQR,resultHous, "QR","Householder","Resultados no dispersa",nn);
        elseif c4 == 1 && c1 == 1 %simetrica y definida positiva
            %aplicar cholesky
            string = 'Matriz simétrica y definida positiva. Se resolverá con cholesky';
            disp(string)
            [resultCholesky,contCholesky]=cholesky(A, b);
            iter = contCholesky;
            nn = nn+1;
            graph1Dir(resultCholesky,"Cholesky","Resultados no dispersa",nn);

        elseif c5 == 1 && c6 == 0 %matriz dispersa pero sin diagonal dominante
            string = 'Matriz dispersa. Se resolverá con givens y householder';
            disp(string)
            [resultGiv,contGiv]=givens(A, b); 
            [resultHous,contHous] = Householder(A,b);
            iter = contGiv+contHous;
            nn = nn+1;
            graph2Dir(resultGiv,resultHous, "Givens","Householder","Resultados dispersa",nn);
        else
            %no se cumplio ninguna especifica, se aplicara  doolittle y QR
            string = 'No se cumplió ninguna condición específica. Se resolverá con LU doolittle y QR';
            disp(string)
            [resultDoolittle,contDoolittle]=doolittle(A, b); 
            [resultQR,contQR] = QR(A,b);
            iter = contDoolittle+contQR;
            nn = nn+1;
            graph2Dir(resultDoolittle,resultQR, "Doolittle","QR","Resultados matriz pequeña",nn);
            %aplicar ambos
        end
        
            
    end
end
    

end