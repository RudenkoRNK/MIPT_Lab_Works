% plot parameters
X1=kF9nc1/kF8a(nc1);
Y1=mU9nc1/mU8a(nc1);
X2=kF9nc2/kF8a(nc2);
Y2=mU9nc2/mU8a(nc2);


%sort
s = [X1 Y1];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);
s = [X2 Y2];
s = sortrows(s,1);
X2 = s(:, 1);
Y2 = s(:, 2);

Y3=[1/sqrt(2) 1/sqrt(2)];
X3=[min(X1(1), X2(1)), max(X1(end), X2(end))];

% make new space
figure;
hold on;
grid on;

% plot1
plot1 = plot(X1, Y1);
plot1.LineStyle = '--';
plot1.LineWidth = 1.2;
plot1.Marker = '.';
plot1.MarkerSize = 10;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';


% plot2
plot2 = plot(X2, Y2);
plot2.LineStyle = ':';
plot2.LineWidth = 1.2;
plot2.Marker = '.';
plot2.MarkerSize = 10;
plot2.MarkerEdgeColor = 'k';
plot2.MarkerFaceColor = 'k';

% plot3
plot3 = plot(X3, Y3);
plot3.LineStyle = '-';
plot3.LineWidth = 0.8;
plot3.Color = 'k';
plot3.Marker = '.';
plot3.MarkerSize = 0.1;

% legend
l=legend(strcat('C_{n}, n=', num2str(nc1)),strcat('C_{n}, n=', num2str(nc2)));
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence of amplitude on frequency');
xlabel('f/f0');
ylabel('U/U0');
hold off;
