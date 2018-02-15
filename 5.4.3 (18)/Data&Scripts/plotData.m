% plot parameters

%sort
s = [X1 Y1];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);
%sort?_z
s = [X2 Y2];
s = sortrows(s,1);
X2 = s(:, 1);
Y2 = s(:, 2);


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
plot1.MarkerSize = 20;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';

plot2 = plot(X2, Y2);
plot2.LineStyle = '-.';
plot2.LineWidth = 0.5;
plot2.Color = 'k';
plot2.Marker = '*';
plot2.MarkerSize = 6;
plot2.MarkerEdgeColor = 'k';
plot2.MarkerFaceColor = 'k';

% legend
l=legend('^6^0Co', 'unknown');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence of N_0 on \tau');
xlabel('N_0');
ylabel('\tau, \muCi');
hold off;
