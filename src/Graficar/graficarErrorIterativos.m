function graficarErrorIterativos(errorJacobi, errorSeidel, titulo)

figure1 = figure;

axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

plot([errorJacobi],'-sg','MarkerSize',2,'MarkerFaceColor','g'); hold on;
plot([errorSeidel],'-or','MarkerSize',2,'MarkerFaceColor','r'); hold on;

title(titulo)
xlabel('Iteraciones') 
ylabel('Errores');
legend('Gauss-Jacobi', 'Gauss-Seidel');
end

