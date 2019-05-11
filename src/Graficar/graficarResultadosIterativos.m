function graficarResultadosIterativos(resultadoJacobi, resultadoSeidel, titulo)

figure1 = figure;

axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

surf(resultadoJacobi,'FaceColor',[1 0 0],'FaceAlpha',0.5);
surf(resultadoSeidel,'FaceColor',[0 1 0],'FaceAlpha',0.5);
title(titulo);
zlabel('Aproximaciones') 
xlabel('Iteraciones') 
ylabel('Variables');
legend('Gauss-Jacobi', 'Gauss-Seidel');
view(45,20)
end
