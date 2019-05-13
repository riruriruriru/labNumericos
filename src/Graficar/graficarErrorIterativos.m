function graficarErrorIterativos(errorJacobi, errorSeidel, titulo,f)
figure1 = figure(f);

axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
subplot(2,1,1);
plot([errorJacobi],'-sg','MarkerSize',2,'MarkerFaceColor','g'); hold on;
plot([errorSeidel],'-or','MarkerSize',2,'MarkerFaceColor','r'); hold on;

title(titulo)
xlabel('Iteraciones') 
ylabel('Errores');
legend('Gauss-Jacobi', 'Gauss-Seidel');
subplot(2,1,2);
semilogy([errorJacobi],'-sg','MarkerSize',2,'MarkerFaceColor','g'); hold on;
semilogy([errorSeidel],'-or','MarkerSize',2,'MarkerFaceColor','r'); hold on;

title(titulo+" normalizado")
xlabel('Iteraciones') 
ylabel('Errores');
legend('Gauss-Jacobi', 'Gauss-Seidel');
end

