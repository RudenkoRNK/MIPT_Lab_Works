% plot parameters
X1=kF8a;
Y1=RL8a;

%sort
s = [X1 Y1];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);
Y2=[RLAv8a RLAv8a];
X2=[kF8a(1)*0.6 kF8a(1)];

% make new space
figure;
hold on;
grid on;

% plot1
plot1 = plot(X1, Y1);
plot1.LineStyle = 'none';
plot1.LineWidth = 1.2;
plot1.Marker = '.';
plot1.MarkerSize = 10;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';


plot2 = plot(X2, Y2);
plot2.LineStyle = '--';
plot2.LineWidth = 1.2;
plot2.Marker = 'none';
plot2.MarkerSize = 10;
plot2.MarkerEdgeColor = 'k';
plot2.MarkerFaceColor = 'k';

axis([kF8a(1)*0.6 inf 0 inf])

% legend
l=legend('R_{L}(f)','average R_{L}');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='southwest';


% final
title('Dependence of R_{L} on frequency');
xlabel('f, kHz');
ylabel('R_{L}, Ohm');
hold off;
