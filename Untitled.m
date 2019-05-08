%En la primera parte del laboratorio tenemos que evaluar ciertas funciones
%con todo los metodos programados, se declaran las funciones que se van a
%evaluar:

%func1 = @(x) x - 2^(-x);
%func2 = @(x) exp(-x) - x^2 + 3*x - 2;
%func3 = @(x) x^(3) - 7*x^(2) + 14*sin(2*pi*x) - 6;
%Se declaran las condiciones con las cuales se probararan cada una de las
%funciones.

%n = 100; %Nos indica la cantidad de iteraciones que tendremos
%a = 0 ; %Punto inicial
%b = 2 ; %Punto final funcion 1
%c = 1 ; %Punto final funcion 2
%d = 0.2 ; %Punto final funcoin 3
%error = 10^-18; %Error experimentado en el laboratorio
%------------------------------------ % % ----------------------------- %

%derivada1F1 = @(x) 2^(-x)*log(2) +1;
%derivada2F1 = @(x) 2^(-x)*log(2)^2;
%derivada1F2 = @(x) -2*x - exp(-x) +3;
%derivada2F2 = @(x) exp(-x) -2 ;
%derivada1F3 = @(x) x*(3*x-14) + 28*pi*cos(2*pi*x);
%derivada2F3 = @(x) 6*x-56*pi^2*sin(2*pi*x) -14;

%%InicialF1 = reglaFourier(func1,derivada1F1,derivada2F1,a,b);
%InicialF2 = reglaFourier(func2,derivada1F2,derivada2F2,a,c);
%InicialF3 = reglaFourier(func3,derivada1F3,derivada2F3,a,d);

%------------------------------------ % % ----------------------------- %

% %Declaracion de llamado a la funcion 1
% 
%tic,
%[fun3a1,errorBise1,contador1BiseF1,contador2BiseF1] = biseccion(a,b,n,error,func1);
%tiempoF1Bise = toc;
%tic,
%[fun4a1,errorSec1,contador1SecF1,contador2SecF1] = secante(a,b,n,error,func1);
%tiempoF1Sec = toc;
%tic,
%[fun5a1,errorRegu1,contador1ReguF1,contador2ReguF1] = regulaFalsi(a,b,n,error,func1);
%tiempoF1Regu = toc;
%tic,
%[fun6a1,errorNew1,contador1NewF1,contador2NewF1] = newtonRaphson(InicialF1,n,error,func1);
%tiempoF1New = toc;
% 
% % %Declaracion de llamado a la funcion 2
% % 
%tic,
%[fun3a2,errorBise2,contador1BiseF2,contador2BiseF2] = biseccion(a,c,n,error,func2);
%tiempoF2Bise = toc;
%tic,
%[fun4a2,errorSec2,contador1SecF2,contador2SecF2] = secante(a,c,n,error,func2);
%tiempoF2Sec = toc;
%tic,
%[fun5a2,errorRegu2,contador1ReguF2,contador2ReguF2] = regulaFalsi(a,c,n,error,func2);
%tiempoF2Regu = toc;
%tic,
%[fun6a2,errorNew2,contador1NewF2,contador2NewF2] = newtonRaphson(InicialF2,n,error,func2);
%tiempoF2New = toc;
% % 
% % %Declaracion de llamado a la funcion 3
% % 
%tic,
%[fun3a3,errorBise3,contador1BiseF3,contador2BiseF3] = biseccion(a,d,n,error,func3);
%tiempoF3Bise = toc;
%tic,
%[fun4a3,errorSec3,contador1SecF3,contador2SecF3] = secante(a,d,n,error,func3);
%tiempoF3Sec = toc;
%tic,
%[fun5a3,errorRegu3,contador1ReguF3,contador2ReguF3] = regulaFalsi(a,d,n,error,func3);
%tiempoF3Regu = toc;
%tic,
%[fun6a3,errorNew3,contador1NewF3,contador2NewF3] = newtonRaphson(InicialF3,n,error,func3);
%tiempoF3New = toc;
% 
% %Llamado a las graficas de las funciones
% 
% %Funcion 1
% 
%tiempoF1 = [tiempoF1Bise,tiempoF1Sec,tiempoF1Regu,tiempoF1New];
%contadorA1F1 = [contador1BiseF1,contador1SecF1,contador1ReguF1,contador1NewF1];
%contadorA2F1 = [contador2BiseF1,contador2SecF1,contador2ReguF1,contador2NewF1];
%graficarValores(fun3a1, fun4a1, fun5a1, fun6a1);
%graficarErrores(errorBise1, errorSec1, errorRegu1, errorNew1);
% 
% % ------------------------------------% % -------------------------------%
% 
% % %Funcion 2
% % 
%tiempoF2 = [tiempoF2Bise,tiempoF2Sec,tiempoF2Regu,tiempoF2New];
%contadorA1F2 = [contador1BiseF2,contador1SecF2,contador1ReguF2,contador1NewF2];
%contadorA2F2 = [contador2BiseF2,contador2SecF2,contador2ReguF2,contador2NewF2];
%graficarValores(fun3a2, fun4a2, fun5a2, fun6a2);
%graficarErrores(errorBise2, errorSec2, errorRegu2, errorNew2);
% % 
% % % ------------------------------------% % -------------------------------%
% %  
% % %Funcion 3
% % 
%tiempoF3 = [tiempoF3Bise,tiempoF3Sec,tiempoF3Regu,tiempoF3New];
%contadorA1F3 = [contador1BiseF3,contador1SecF3,contador1ReguF3,contador1NewF3];
%contadorA2F3 = [contador2BiseF3,contador2SecF3,contador2ReguF3,contador2NewF3];
%graficarValores(fun3a3, fun4a3, fun5a3, fun6a3);
%graficarErrores(errorBise3, errorSec3, errorRegu3, errorNew3);
% 
% % Metodo de Newton-Raphson multivariable: Procedemos hacer la parte 3 del
% % laboratios que nos indica evaluar dos sistema de ecuaciones:
% 
% 1. Sistema de ecuaciones: (2 variables)
%partida1 = [0 0]';
%syms x y

%f1 = x^2 - 10*x + y^2 + 8;
%f2 = x * y^2 + x - 10*y + 8;
%F2 = [f1, f2];
%error2 = 10^-15;
%tic,
%[sistema1, errorNM2, contador1NewM2,contador2NewM2] = newtonRaphsonMult(F2, partida1, error2, n);
%tiempoNM2 = toc;
%graficarNewtonRaphsonMult2V(sistema1, 'Solucion del sistema 1');
%graficarNewtonRaphsonMult2VError(errorNM2 , 'Errores del sistema 1');
% 
% 2. Sistema de ecuaciones: (3 variables)
partida2 = [0 0 0]';
syms x y z
f3 = x^2 + y - 37;
f4 = x - y^2 - 5;
f5 = x + y + z - 3;
F3 = [f3, f4, f5];
error3 = 10^-15;
%tic,
n = 100;
[sistema2, errorNM3, contador1NewM3,contador2NewM3] = newtonRaphsonMult(F3, partida2, error3, n);
%tiempoNM3 = toc;
%graficarNewtonRaphsonMult3V(sistema2, 'Solucion del sistema 2');
%graficarNewtonRaphsonMult3VError(errorNM3, 'Errores del sistema 2');

%Ahora tenemos que guardar las imagenes que creamos:

%Ingresamos a la carpeta para guardar las imagenes
%cd 'Lab 1'/
%cd 'Imagenes MNL'/;

%Guardamos los resultados de la funcion 1
%h = figure(1);
%saveas(h, 'resultadosFuncion1.png');
%h = figure(2);
%saveas(h, 'erroresFuncion1.png');
%%Guardamos los resultados de la funcion 2
%h = figure(3);
%saveas(h, 'resultadosFuncion2.png');
%h = figure(4);
%saveas(h, 'erroresFuncion2.png');
% Guardamos los resultados de la funcion 3
%h = figure(5);
%saveas(h, 'resultadosFuncion3.png');
%h = figure(6);
%saveas(h, 'erroresFuncion3.png');
%Guardamos los resultados de Newton-Raphson 2 variables
%h = figure(7);
%saveas(h, 'resultadosNewtonM2var.png');
%h = figure(8);
%saveas(h, 'erroresNewtonM2var.png');
%Guardamos los resultados de Newton-Raphson 3 variables
%h = figure(9);
%saveas(h, 'resultadosNewtonM3var.png');
%h = figure(10);
%saveas(h, 'erroresNewtonM3var.png');
