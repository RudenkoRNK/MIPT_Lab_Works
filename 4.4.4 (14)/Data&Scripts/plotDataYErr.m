% plot parameters
X1=(1:2:20)';
Y1=(1:2:20)'*10;

Y1Err=rand(10,1);

%sort
s = [X1 Y1 Y1Err];
s = sortrows(s,1);
X1 = s(:, 1);
Y1 = s(:, 2);
Y1Err = s(:, 3);

% make new space
figure;
hold on;
grid on;

% plot1
plot1 = errorbar(X1, Y1, Y1Err);
plot1.LineStyle = 'none';
plot1.LineWidth = 0.5;
plot1.Marker = '.';
plot1.MarkerSize = 6;
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
l=legend('Y(X)',...
        strcat('linear fit=',num2str(fit1Coefs(1), '%5.2f')) );
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence Y on X ');
xlabel('X, sec');
ylabel('Y, m');
hold off;
