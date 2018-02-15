function [fitobj, fitcoeffs, fiterrs]= plot_series(data, ix, iy, nPlots )
    if nargin <= 0
        error('input_example :  data is a required input')
    end
    [nData, ~]=size(data.data);
    if(nData==0) 
        return
    end
    if nargin == 1
        nPlots=nData;
        ix=zeros(nPlots,1)+1;
        iy=zeros(nPlots,1)+2;
    end
    if nargin == 2
        nPlots=min(max(size(ix)), nData);
        iy=ones(nPlots,1)+1;
    end
    if nargin == 3
        nPlots=min([max(size(ix)), max(size(iy)), nData]);
    end
    if nargin == 4
        if(max(size(ix))<nPlots)
            ix=zeros(nPlots,1)+ix(1);
        end
        if(max(size(iy))<nPlots)
            iy=zeros(nPlots,1)+iy(1);
        end
    end
    
    leglines=1;
    leg=cell(nPlots*leglines, 1);
    fitobj=cell(nPlots, 1);
    fitcoeffs=cell(nPlots,1);
    fiterrs=cell(nPlots,1);
    format='%+5.3f';
    formaterr='%5.3f';

    % make new space
    figure;
    hold on;
    grid on;

    % setup styles
    lineStyles={'none', 'none', 'none', 'none'};
    lineWidths={2, 2, 2, 2};
    colors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
    markers={'.', '+', 'x', '^', 'v', 'x', 'd', '^', 'v', '>', '<', 'p', 'h', 's'};
    markerSizes={5, 2, 2, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8};
    markerEdgeColors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
    markerFaceColors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};

    ileg=1;
    for iData=nPlots:-1:1
        plotnum=iData;

        X=data.data{iData}(:,ix(iData));
        Y=data.data{iData}(:,iy(iData));

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

        leg{ileg}=data.names{iData};
        ileg=ileg+1;
        for iter=1:leglines-2
            plotx=plot(X(1), Y(1));
            plotx.Marker='none';
            plotx.LineStyle='none';
        end
    end

    % legend
    l=legend(leg);
    l.TextColor='k';
    l.Color = 'w';
    l.Box = 'on';
    l.EdgeColor = [0.15 0.15 0.15];
    l.LineWidth = 0.5;
    l.Location ='northwest';

    % final
    title(['Dependence of ' data.colNames{iData}{iy(1)} ' on ' data.colNames{iData}{ix(1)}]);
    xlabel([data.colNames{iData}{ix(1)} ' [' data.colUnits{iData}{ix(1)} ']']);
    ylabel([data.colNames{iData}{iy(1)} ' [' data.colUnits{iData}{iy(1)} ']']);
    hold off;
end 