function createfigureAproxIt(Y1,name)
%CREATEFIGURE(Y1, Y2, Y3)
%  Y1:  vector of y data
%  Y2:  vector of y data
%  Y3:  vector of y data

%  Auto-generated by MATLAB on 21-Apr-2017 15:22:48

% Create figure
figure1 = figure('Name',name);

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'on');

% Create plot
plot(Y1);

% Create plot


% Create plot


% Create xlabel
xlabel('Iteracion');

% Create ylabel
ylabel('Aproximacion');

% Create legend
%legend(axes1,'show');
%legend('Jacobi','Seidel');
