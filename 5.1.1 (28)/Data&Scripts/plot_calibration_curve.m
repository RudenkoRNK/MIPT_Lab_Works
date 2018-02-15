datanum=1;
names=comnames; % names by index
ni=comni; % indices by names
X=calib(:,2);
Y=calib(:,1);

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
fit1=fit(X, Y,'poly4');
fit1Plot=plot(fit1);
fitcoefs=coeffvalues(fit1); %#ok<*SAGROW>
fiterrs=confint(fit1);
set(fit1Plot, 'LineStyle', '--');
set(fit1Plot, 'LineWidth', 2);
set(fit1Plot, 'LineJoin', 'round');
set(fit1Plot, 'Color', 'k');

% final
calibfit=fit1;
title('Calibration curve');
xlabel('Angles °');
ylabel('Wavelength, A');
hold off;