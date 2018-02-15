% plot parameters

%sort
s = [X1 Y1];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);

% make new space
figure;
hold on;
grid on;

% plot1
plot1 = plot(X1, Y1);
plot1.LineStyle = '--';
plot1.LineWidth = 0.5;
plot1.Color = 'k';
plot1.Marker = '.';
plot1.MarkerSize = 12;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';

% fit1
fit1=fit(X1, Y1,'poly1');
fit1Plot=plot(fit1);
fit1Coefs=coeffvalues(fit1);
fit1Plot.LineStyle = '--';
fit1Plot.LineWidth = 0.9;
fit1Plot.LineJoin = 'round';

% legend
l=legend('sin\phi over \lambda',...
        strcat('linear fit=',num2str(-1/fit1Coefs(1), '%8.0f'), '±1500\mum') );
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.25 0.25 0.25];
l.LineWidth = 0.5;
l.Location ='northeast';


% final
title('Dependence of sin\phi over \lambda');
xlabel('\lambda, nm');
ylabel('sin\phi');
hold off;
