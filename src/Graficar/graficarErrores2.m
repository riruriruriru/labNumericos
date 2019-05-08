function graficarErrores2(vj, vs, nombre)
%CREATEFIGURE(Y1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

plot([vj],'-sg','MarkerSize',2,'MarkerFaceColor','g'); hold on;
plot([vs],'-or','MarkerSize',2,'MarkerFaceColor','r'); hold on;

title(nombre)
xlabel('Iteraciones') % x-axis label
ylabel('Errores');
legend('Gauss-Jacobi', 'Gauss-Seidel');
end

