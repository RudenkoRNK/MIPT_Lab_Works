function [fitobj, fitcoeffs, fiterrs]= plotdata(data, ix, iy, iData)
    if nargin < 1
        error('input_example :  data is a required input')
    end
    if nargin < 2
        ix=1;
    end
    if nargin < 3
        iy=2;
    end
    if nargin < 4
        iData=1;
    end
    
    X=data.data{iData}(:,ix);
    Y=data.data{iData}(:,iy);
    
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
    fitobj=fit(X, Y,'poly1');
    fit1Plot=plot(fitobj);
    fitcoeffs=coeffvalues(fitobj); %#ok<*SAGROW>
    fiterrs=confint(fitobj);
    set(fit1Plot, 'LineStyle', '--');
    set(fit1Plot, 'LineWidth', 2);
    set(fit1Plot, 'LineJoin', 'round');
    set(fit1Plot, 'Color', 'k');
    
    % legend setup
    leglines=4;
    leg=cell(leglines, 1);
    format='%+5.3f';
    formaterr='%5.3f';
    leg{1}=data.names{iData};
    leg{2}='linear fit a*x+b:';
    leg{3}=['a = ' num2str(fitcoeffs(1), format)...
        '±' num2str(abs(fiterrs(1,1)-fiterrs(2,1))/2, formaterr)];
    leg{4}=['b = ' num2str(fitcoeffs(2), format)...
        '±' num2str(abs(fiterrs(1,2)-fiterrs(2,2))/2, formaterr)...
        data.colUnits{iData}{iy}];
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
    l.Location ='northwest';
    
    title(['Dependence of ' data.colNames{iData}{iy} ' on ' data.colNames{iData}{ix}]);
    xlabel([data.colNames{iData}{ix} ' [' data.colUnits{iData}{ix} ']']);
    ylabel([data.colNames{iData}{iy} ' [' data.colUnits{iData}{iy} ']']);
    hold off;
end