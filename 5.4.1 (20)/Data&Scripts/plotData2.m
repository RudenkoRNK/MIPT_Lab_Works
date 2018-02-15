% plot parameters
X2=data2(:, 1);
Y2=data2(:, 2);
%sort
s = [X2 Y2];
s = sortrows(s,1);
X2 = s(:, 1);
Y2 = s(:, 2);

% make new space
figure;
hold on;
grid on;

% plot2
plot2 = plot(X2, Y2);
plot2.LineStyle = '--';
plot2.LineWidth = 0.5;
plot2.Color = 'k';
plot2.Marker = '.';
plot2.MarkerSize = 10;
plot2.MarkerEdgeColor = 'k';
plot2.MarkerFaceColor = 'k';


% legend
l=legend('N(P)');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.25 0.25 0.25];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence of count speed on pressure');
xlabel('P torr');
ylabel('N s^-^2');
hold off;
