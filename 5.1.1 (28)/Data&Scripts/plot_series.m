data=vacdata;
names=vacnames; % names by index
ni=vacni; % indices by names
N=NV;
V0=zeros(NV,1);
vacwl=zeros(NV,1);

leglines=3;
leg=cell(N*leglines, 1);
fit1=cell(N, 1);
fitcoefs=cell(N,1);
fiterrs=cell(N,1);
format='%5.0f';
formaterr='%5.0f';

% make new space
figure;
hold on;
grid on;

% setup styles
lineStyles={'none', 'none', 'none', 'none'};
lineWidths={2, 2, 2, 2};
colors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
markers={'.', '+', 'x', '^', 'v', 'x', 'd', '^', 'v', '>', '<', 'p', 'h', 's'};
markerSizes={25, 10, 6, 6, 8, 8, 8, 8, 8, 8, 8, 8, 8};
markerEdgeColors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
markerFaceColors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
fitLineStyles={'--', ':', '-.', '-'};
fitLineWidths={1, 1, 1, 1};
fitLineJoins={'round', 'round', 'round'};
xmin=max(data{1}(:,2));

for datanum=1:N
    plotnum=datanum;
    
    X=data{datanum}(:,2);
    xmin=min(max(X), xmin);
    Y=(data{datanum}(:,1));
    
    % sort
    s = [X Y];
    s = sortrows(s,1);
    X = s(:, 1);
    Y = s(:, 2);
    
    % plot1
    plot1 = plot(X, Y);
    set(plot1, 'LineStyle', get_circled(lineStyles, plotnum));
    set(plot1, 'LineWidth', get_circled(lineWidths, plotnum));
    set(plot1, 'Color', get_circled(colors, plotnum));
    set(plot1, 'Marker', get_circled(markers, plotnum));
    set(plot1, 'MarkerSize', get_circled(markerSizes, plotnum));
    set(plot1, 'MarkerEdgeColor', get_circled(markerEdgeColors, plotnum));
    set(plot1, 'MarkerFaceColor', get_circled(markerFaceColors, plotnum));
    
    % fit1
    ft = fittype( 'smoothingspline' );
    opts = fitoptions( 'Method', 'SmoothingSpline' );
    opts.SmoothingParam = 0.955311349147546;
    [fit1{datanum}, gof]=fit(X, Y, ft, opts );
    fit1Plot = plot(fit1{datanum});
    fitcoefs{datanum}=coeffvalues(fit1{datanum}); %#ok<*SAGROW>
    set(fit1Plot, 'LineStyle', get_circled(fitLineStyles, plotnum));
    set(fit1Plot, 'LineWidth', get_circled(fitLineWidths, plotnum));
    set(fit1Plot, 'LineJoin', get_circled(fitLineJoins, plotnum));
    set(fit1Plot, 'Color', get_circled(colors, plotnum));
    
    vacwl(datanum)=calibfit(angles(datanum));
    leg{leglines*(plotnum-1)+1}=['wavelength = ' num2str(vacwl(datanum), format) 'A'];
    leg{leglines*(plotnum-1)+2}='smoothing spline';
    V0(datanum)=fit1{datanum}(0);
    leg{leglines*(plotnum-1)+3}=['V0 = ' num2str(V0(datanum), '%5.3f') 'V'];
    for iter=1:leglines-2
        plotx=plot(X(1), Y(1));
        plotx.Marker='none';
        plotx.LineStyle='none';
    end
end

vacfit=fit1;

% legend
l=legend(leg);
l.TextColor='k';
l.Color = 'w';
l.Box = 'on';
l.EdgeColor = [0.15 0.15 0.15];
l.LineWidth = 0.5;
l.Location ='southeast';

% final
title('VAC');
xlim([0 xmin])
xlabel('U, V');
ylabel('sqrt(I)');
hold off;