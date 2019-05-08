function graphErrorsDoolittleCholeskyGivens(eD, eC,eG)
%CREATEFIGURE(Y1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

plot([eD],'-sg','MarkerSize',2,'MarkerFaceColor','g'); hold on;
plot([eC],'-or','MarkerSize',2,'MarkerFaceColor','r'); hold on;
plot([eG],'-or','MarkerSize',2,'MarkerFaceColor','b'); hold on;

title('Errores')
xlabel('Iteraciones') % x-axis label
ylabel('Errores');
legend('Doolittle', 'Cholesky', 'Givens');
end
