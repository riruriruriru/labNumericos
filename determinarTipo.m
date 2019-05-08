function [resultado] = determinarTipo(A)
%caracteristicas
%c1 = logical(definidaPositiva(matrix)) %def positiva
%c2 = logical(definidaSemiPositiva(matrix)) %semi positiva
%c3 = logical(definidaNegativa(matrix)) %negativa
%c4 = logical(simetrica(matrix)) %simetrica
%c5 = logical(dispersa(matrix)) %dispersa
%c6 = logical(diagonalDominante(matrix)) %diagonal dominante
[c1,c2,c3,c4,c5,c6] = determinarC(A);
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
    string = 'Matriz no es cuadrada';
    disp(string)
    return
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
            end
        else
            string = 'Se resolverá con método QR';
            disp(string)
            %APLICAR QR
        end
    else
        string = 'Matriz se considera pequeña, se decidirá entre métodos directos, excepto QR';
        disp(string)
        if c4 == 1 && c1 ~= 0 %matriz simetrica no definida positiva
            %aplicar housholder
            string = 'Matriz simétrica y no definida positiva. Se resolverá con housholder';
            disp(string)
        
        elseif c4 == 1 && c1 == 1 %simetrica y definida positiva
            %aplicar cholesky
            string = 'Se resolverá con cholesky';
            disp(string)
        
        elseif c5 == 1 %matriz dispersa
            string = 'Se resolverá con givens';
            disp(string)
            %aplicar givens
        else
            %no se cumplio ninguna especifica, se aplicara crout y doolittle
            string = 'Se resolverá con LU crout y LU doolittle';
            disp(string)
            %aplicar ambos
        end
        
            
    end
end
    

end