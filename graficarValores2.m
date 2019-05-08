function graficarValores2(vd, vc, vqr,giv,hou)
%CREATEFIGURE(Y1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

plot([vd],'og','MarkerSize',2,'MarkerFaceColor','g'); hold on;
plot([vc],'*m','MarkerSize',2,'MarkerFaceColor','m'); hold on;
plot([vqr],'+b','MarkerSize',2,'MarkerFaceColor','b'); hold on;
plot([giv],'pc','MarkerSize',2,'MarkerFaceColor','c'); hold on;
plot([hou],'ok','MarkerSize',2,'MarkerFaceColor','k'); hold on;
title('Aproximaciones en el sistema 2')
ylabel('Aproximaciones') % y-axis label
xlabel('Variables') % x-axis label
legend('Doolittle', 'Cholesky', 'QR', 'Givens' ,'Housholder');
end