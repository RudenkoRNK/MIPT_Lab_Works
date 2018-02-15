datanum=1;
X=2*pi*3*10^17./(vacwl/10);
Y=V0;

% make new space
figure;
hold on;
grid on;

% sort
s = [X Y];
s = sortrows(s,1);
X = s(:, 1);
Y = s(:, 2);

% plot1
plot1 = plot(X, Y);
set(plot1, 'LineStyle', 'none');
set(plot1, 'LineWidth', 2);
set(plot1, 'Color', 'k');
set(plot1, 'Marker', '.');
set(plot1, 'MarkerSize', 25);
set(plot1, 'MarkerEdgeColor', 'k');
set(plot1, 'MarkerFaceColor', 'k');

% fit1
fit1=fit(X, Y,'poly1');
fit1Plot=plot(fit1);
fitcoefs=coeffvalues(fit1); %#ok<*SAGROW>
fiterrs=confint(fit1);
set(fit1Plot, 'LineStyle', '--');
set(fit1Plot, 'LineWidth', 2);
set(fit1Plot, 'LineJoin', 'round');
set(fit1Plot, 'Color', 'k');

% legend setup
leglines=2;
leg=cell(leglines, 1);
format='%+5.3e';
formaterr='%5.3e';
leg{1}='linear fit a*x+b:';
leg{2}=['plank const = ' num2str(-fitcoefs(1), format) 'eV'];
for iter=1:leglines-2
    plotx=plot(X(1), Y(1));
    plotx.Marker='none';
    plotx.LineStyle='none';
end

% legend
l=legend(leg);
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='southwest';

% final
comfitcoefs=fitcoefs;
comfiterrs=fiterrs;
title('Dependence of V_0 on \omega');
xlabel('\omega');
ylabel('V_0');
hold off;