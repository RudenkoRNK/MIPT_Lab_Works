%% plot parameters
[U00, t] = max(U0);
Y1=U0/U00;
X1=nu0/nu0(t);
Y1Err=U0.*(U0Err./U0+U0Err(t)/U00)/U00;

[U01, t] = max(U1);
Y2=U1/U01;
X2=nu1/nu1(t);
Y2Err=U1.*(U1Err./U1+U1Err(t)/U01)/U01;

Y3=[1/sqrt(2) 1/sqrt(2)];
X3=[0.8 1.2];

%% make new space
figure;
hold on;
grid on;

%% plot1
plot1 = errorbar(X1, Y1, Y1Err);
plot1.LineStyle = '-.';
plot1.LineWidth = 0.3;
plot1.Color = 'k';
plot1.Marker = 'o';
plot1.MarkerSize = 3;
plot1.MarkerEdgeColor = 'k';
plot1.MarkerFaceColor = 'k';

%% plot2
plot2 = errorbar(X2, Y2, Y2Err);
plot2.LineStyle = '--';
plot2.LineWidth = 0.3;
plot2.Color = 'k';
plot2.Marker = 'x';
plot2.MarkerSize = 6;
plot2.MarkerEdgeColor = 'k';
plot2.MarkerFaceColor = 'k';

%% plot3
plot3 = plot(X3, Y3);
plot3.LineStyle = '-';
plot3.LineWidth = 0.8;
plot3.Color = 'k';
plot3.Marker = '.';
plot3.MarkerSize = 0.1;

%% legend
l=legend('R = 0 Ohm',...
         'R = 100 Ohm', ...
         'sqrt(2)/2 level');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northeast';


%% final
title('Q-factor');
xlabel('nu/nu0');
ylabel('U/U0');
hold off;
