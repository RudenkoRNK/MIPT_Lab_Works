% plot parameters
X1=kF10nc1/kF8a(nc1);
Y1=dPhiS10nc1;
Y1Err = dPhiSErr10nc1;
X2=kF10nc2/kF8a(nc2);
Y2=dPhiS10nc2;
Y2Err = dPhiSErr10nc2;

%sort
s = [X1 Y1 Y1Err];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);
Y1Err = s(:, 3);

s = [X2 Y2 Y2Err];
s = sortrows(s,1);
X2 = s(:, 1);
Y2 = s(:, 2);
Y2Err = s(:, 3);

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


% plot2
plot2 = plot(X2, Y2);
plot2.LineStyle = 'none';
plot2.LineWidth = 1.2;
plot2.Marker = 'x';
plot2.MarkerSize = 7;
plot2.MarkerEdgeColor = 'k';
plot2.MarkerFaceColor = 'b';

% legend
l=legend(strcat('C_{n}, n=', num2str(nc1)),strcat('C_{n}, n=', num2str(nc2)));
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence of phase on frequency');
xlabel('f, kHz');
ylabel('\Delta\phi/\pi');
hold off;
