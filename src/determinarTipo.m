function [resultado] = determinarTipo(A, b)
%caracteristicas
%c1 = logical(definidaPositiva(matrix)) %def positiva
%c2 = logical(definidaSemiPositiva(matrix)) %semi positiva
%c3 = logical(definidaNegativa(matrix)) %negativa
%c4 = logical(simetrica(matrix)) %simetrica
%c5 = logical(dispersa(matrix)) %dispersa
%c6 = logical(diagonalDominante(matrix)) %diagonal dominante
[c1,c2,c3,c4,c5,c6] = determinarC(A);
tolerancia = 10^-18;
a = 5;
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
        string = 'Matriz no es cuadrada y peque�a, solo se resolver� con m�todo QR, Givens y Housholder';
        disp(string)
        return
    end
else
    string = 'Matriz cuadrada';
    disp(string)
    if n>300
        string = 'Matriz se considera grande, se decidir� entre m�todos iterativos: gauss seidel y gauss jacobi, adem�s del m�todo directo QR';
        disp(string)
        if c5 == 1 %matriz dispersa
            if c6 == 1%diagonal dominante
                %aplicar gauss seidel y jacobi
                string = 'Matriz tiene diagonal dominante. Se resolver� con m�todo gauss seidel y gauss jacobi';
                disp(string)
            end
        end
    else
        string = 'Matriz se considera peque�a, se decidir� entre m�todos directos';
        disp(string)
        if c1 == 1 && c4 == 1 && c5 == 1 && c6 == 1
            string = 'Matriz simetrica, definida positiva, dispersa y diagonal dominante. Se resolver� con cholesky, givens, LU doolittle y metodos iterativos';
            disp(string)
            tic,
            [xCholesky,eCholesky,c1C,c2C]=cholesky(A, b)
            tiempoCholesky = toc
            tic,
            [xDoolittle,eDoolittle,c1D,c2D] = doolittle(A, b) 
            tiempoDoolittle = toc
            tic,
            [xGivens,eGivens,c1G,c2G] = givens(A,b)
            tiempoGivens = toc
            graphDoolittleCholeskyGivens(xDoolittle, xCholesky, xGivens)
            graphErrorsDoolittleCholeskyGivens(eDoolittle, eCholesky,eGivens);
            time = [tiempoDoolittle, tiempoCholesky, tiempoGivens]
            graphTDoolittleCholeskyGivens(time);
            %agregar iterativos
        elseif c1 == 1 && c4 == 1 && c5 == 1 && c6 == 0
            string = 'Matriz simetrica, definida positiva y dispersa. Se resolver� con cholesky, givens y LU doolittle';
            disp(string)
            tic,
            [xCholesky,eCholesky,c1C,c2C]=cholesky(A, b)
            tiempoCholesky = toc
            tic,
            [xDoolittle,eDoolittle,c1D,c2D] = doolittle(A, b) 
            tiempoDoolittle = toc
            tic,
            [xGivens,eGivens,c1G,c2G] = givens(A,b)
            tiempoGivens = toc
            graphDoolittleCholeskyGivens(xDoolittle, xCholesky, xGivens)
            graphErrorsDoolittleCholeskyGivens(eDoolittle, eCholesky,eGivens);
            time = [tiempoDoolittle, tiempoCholesky, tiempoGivens]
            graphTDoolittleCholeskyGivens(time);
       
        elseif c4 == 1 && c1 ~= 1 && c5 == 1 && c6 == 0
            string = 'Matriz simetrica, dispersa y no definida positiva. Se resolver� con housholder, givens, QR y LU doolittle';
            disp(string)
            %aplicar 3 metodos
        elseif c6 == 1 && c5 == 1   %dispersa y diagonal dominante
            string = 'Matriz dispersa y diagonal dominante, se resolvera con m�todos directos';
            disp(string)
        elseif c5 ==0 %matriz no dispersa
            %aplicar housholder
            string = 'Matriz no dispersa. Se resolver� con housholder y QR';
            disp(string)
        
        elseif c4 == 1 && c1 == 1 %simetrica y definida positiva
            %aplicar cholesky
            string = 'Matriz sim�trica y definida positiva. Se resolver� con cholesky';
            disp(string)
        
        elseif c5 == 1 && c6 == 0 %matriz dispersa pero sin diagonal dominante
            string = 'Matriz dispersa. Se resolver� con givens y householder';
            disp(string)
            %aplicar givens
        else
            %no se cumplio ninguna especifica, se aplicara  doolittle
            string = 'No se cumpli� ninguna condici�n espec�fica. Se resolver� con LU doolittle y QR';
            disp(string)
            %aplicar ambos
        end
        
            
    end
end
    

end