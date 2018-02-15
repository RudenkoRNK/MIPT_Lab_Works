% plot parameters

%sort
s = [X2 Y2];
s = sortrows(s,1);
X2 = s(:, 1);
Y2 = s(:, 2);

% make new space
figure;
hold on;
grid on;

% plot1
plot1 = plot(X2, Y2);
plot1.LineStyle = '--';
plot1.LineWidth = 0.8;
plot1.Color = 'k';
plot1.Marker = '.';
plot1.MarkerSize = 12;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';


% legend
l=legend('D(\lambda) over m' );
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.25 0.25 0.25];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence D over m');
xlabel('m');
ylabel('D, 1/nm');
hold off;
