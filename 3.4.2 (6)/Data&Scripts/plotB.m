% plot parameters
X1=TK;
Y1=1./(tau.^2-tau0^2);


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
plot1.LineStyle = 'none';
plot1.LineWidth = 0.5;
plot1.Marker = '.';
plot1.MarkerSize = 10;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';

% fit1
fit1=fit(X1(5:end), Y1(5:end),'poly1');
fit1Plot=plot(fit1);
fit1Coefs=coeffvalues(fit1);
fit1Plot.LineStyle = '--';
fit1Plot.LineWidth = 0.9;
fit1Plot.LineJoin = 'round';

% legend
l=legend('1/(\tau^2-\tau_{0}^2) on T',...
        strcat('linear fit=',num2str(-fit1Coefs(2)/fit1Coefs(1)-273.15, '%6.1f'), '\circC') );
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence  of magnetic susceptibility on temperature ');
xlabel('T, K');
ylabel('1/(\tau^2-\tau_{0}^2), s^{-2}');
hold off;
