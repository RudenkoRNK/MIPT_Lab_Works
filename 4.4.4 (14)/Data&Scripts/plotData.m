% plot parameters
X1 = (1:nAgGr)';
Y1 = ((dAgGr.*dAgGr)/4/fAg^2)';
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
plot1.LineStyle = 'none';
plot1.LineWidth = 0.8;
plot1.Color = 'k';
plot1.Marker = '.';
plot1.MarkerSize = 12;
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
interfBase = laAgGr/fit1Coefs(1);
l=legend('\theta_{i}^{2}',...
        strcat('Interferometer base = ',num2str(interfBase, '%5.2f'), 'mm')');
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.25 0.25 0.25];
l.LineWidth = 0.5;
l.Location ='northwest';


% final
title({'Dependence of \theta_{i}^{2} on circle number';...
            'Mercury green line'});
xlabel('circle number');
ylabel('\theta_{i}^{2}');
hold off;
