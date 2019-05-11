function graficarResultadosDirSinGivens(doolittle, housholder, cholesky,qr)
[n,m] = size(doolittle)
subplot(2,2,1);
plot([doolittle],'og','MarkerSize',2,'MarkerFaceColor','g'); hold on;
ylabel('Resultados') 
xlabel('Variables')
legend('Doolittle');
subplot(2,2,2);
plot([cholesky],'*m','MarkerSize',2,'MarkerFaceColor','m'); hold on;
ylabel('Resultados') 
xlabel('Variables')
legend('Cholesky');
subplot(2,2,3);
plot([qr],'+b','MarkerSize',2,'MarkerFaceColor','b'); hold on;
ylabel('Resultados') 
xlabel('Variables')
legend('QR');
subplot(2,2,4);
plot([housholder],'ok','MarkerSize',2,'MarkerFaceColor','k'); hold on;
ylabel('Resultados') 
xlabel('Variables') 
legend('Householder');


end