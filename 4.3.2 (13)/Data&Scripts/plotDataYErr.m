% plot parameters
X1=1./data2(:, 1);
Y1=data2(:, 2);

Y1Err=rand(10,1);

%sort

% make new space
figure;
hold on;
grid on;

% plot1
plot1 = plot(X1, Y1);
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
l=legend('\Lambda(1/\nu)',...
        strcat('linear fit=',num2str(fit1Coefs(1), '%5.2f')) );
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title('Dependence of \Lambda on 1/\nu ');
xlabel('1/\nu, \musec');
ylabel('\Lambda, \mum');
hold off;
