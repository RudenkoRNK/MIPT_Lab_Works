% plot parameters
X1=TK;
Y1=tau.^2-tau0^2;


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
plot1.Marker = '.';
plot1.MarkerSize = 10;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';


% legend
l=legend('(\tau^2-\tau_{0}^2)(T)' );
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northeast';


% final
title('Dependence  of magnetic susceptibility on temperature');
xlabel('T, K');
ylabel('\tau^2-\tau_{0}^2, s^2');
hold off;
