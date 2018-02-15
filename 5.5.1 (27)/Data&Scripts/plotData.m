%sort

s = [X Y];
s = sortrows(s,1);
X = s(:, 1);
Y = s(:, 2);
format='%5.3f';

line_styles={'none', 'none', 'none', 'none'};
line_widths={2, 2, 2, 2};
colors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
markers={'.', '+', 's', '*', 'o', 'x', 'd', '^', 'v', '>', '<', 'p', 'h'};
marker_sizes={25, 10, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8};
marker_edge_colors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
marker_face_colors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};

fit_line_styles={'--', ':', '-.', '-'};
fit_line_widths={2, 2, 2, 2};
fit_line_joins={'round', 'round', 'round'};

% plot1
plot1 = plot(X, Y);
plot1.LineStyle = line_styles{k};
plot1.LineWidth = line_widths{k};
plot1.Color = colors{k};
plot1.Marker = markers{k};
plot1.MarkerSize = marker_sizes{k};
plot1.MarkerEdgeColor = marker_edge_colors{k};
plot1.MarkerFaceColor = marker_face_colors{k};

% fit1
fit1=fit(X, Y,'poly1');
fit1Plot=plot(fit1);
fit1Plot.LineStyle = fit_line_styles{k};
fit1Plot.LineWidth = fit_line_widths{k};
fit1Plot.LineJoin = fit_line_joins{k};
fit1Plot.Color=colors{k};

leglines=5;
fitcoefs{k}=coeffvalues(fit1);
fiterrs{k}=confint(fit1);
leg{leglines*(k-1)+1}=names{k};
leg{leglines*(k-1)+2}='linear fit \mul+b:';
leg{leglines*(k-1)+3}=['\mu = ' num2str(fitcoefs{k}(1), format)...
    '±' num2str(abs(fiterrs{k}(1,1)-fiterrs{k}(2,1))/2, format)];
leg{leglines*(k-1)+4}=['\mu'' = ' num2str(fitcoefs{k}(1)/density(k), format)...
    '±' num2str(abs(fiterrs{k}(1,1)-fiterrs{k}(2,1))/2/density(k), format)];
leg{leglines*(k-1)+5}=['b = ' num2str(fitcoefs{k}(2), format)...
    '±' num2str(abs(fiterrs{k}(1,2)-fiterrs{k}(2,2))/2, format)];
for iter=1:leglines-2
    plotx=plot(X(1), Y(1));
    plotx.Marker='none';
    plotx.LineStyle='none';
end