function plot_data(data, ix, iy, iData)
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
    set(plot1, 'MarkerSize', 5);
    set(plot1, 'MarkerEdgeColor', 'k');
    set(plot1, 'MarkerFaceColor', 'k');
    
    % legend setup
    leglines=1;
    leg=cell(leglines, 1);
    leg{1}=data.names{iData};
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
    l.Location ='northeast';
    
    title(['Dependence of ' data.colNames{iData}{iy} ' on ' data.colNames{iData}{ix}]);
    xlabel([data.colNames{iData}{ix} ' [' data.colUnits{iData}{ix} ']']);
    ylabel([data.colNames{iData}{iy} ' [' data.colUnits{iData}{iy} ']']);
    hold off;
end