function graphTimeDir(tiempos,t,name1,name2,name3,name4,name5)
%CREATEFIGURE(YVECTOR1)
%  YVECTOR1:  bar yvector

%  Auto-generated by MATLAB on 02-May-2017 19:52:54

% Create figure
figure1 = figure('Name','Tiempo metodos');

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'on');

xlabel('Metodo');

% Create ylabel
ylabel('Tiempo (s)');
title(t);
% Create bar
c = {name1,name2,name3,name4,name5};
prices = [123 99 23];
bar(tiempos)
set(gca, 'XTick', 1:6, 'XTickLabel', c);
