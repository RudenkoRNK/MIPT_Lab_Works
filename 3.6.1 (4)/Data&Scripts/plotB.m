% plot parameters
X1=fB/1000;
Y1=nuB/1000;
Y1Err=nuBerr/1000;
fitType2 = fittype(@(b, x) x+b);

% make new space
figure;
hold on;
grid on;

% plot1
plot1 = errorbar(X1, Y1, Y1Err);
plot1.LineStyle = 'none';
plot1.LineWidth = 0.5;
plot1.Marker = '.';
plot1.MarkerSize = 6;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';

% fit1
fit1=fit(X1, Y1,'poly1');
fit1Plot=plot(fit1);
fit1Coefs=coeffvalues(fit1);
fit1Plot.LineStyle = '--';
fit1Plot.LineWidth = 0.9;
fit1Plot.LineJoin = 'round';

% fit2
fit2=fit(X1, Y1,fitType2);
fit2Plot=plot(fit2);
fit2Coefs=coeffvalues(fit2);
fit2Plot.LineStyle = '-';
fit2Plot.LineWidth = 0.7;
fit2Plot.LineJoin = 'round';

% legend
l=legend('\delta\nu(f)',...
        strcat('experimental fit=',num2str(fit1Coefs(1), '%5.2f')),...
        'theoretical fit=1.00');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence of \delta\nu on pulse frequecy ');
xlabel('f, kHz');
ylabel('\delta\nu, kHz');
hold off;
