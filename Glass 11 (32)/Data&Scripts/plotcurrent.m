function [fitobj, fitcoeffs, fiterrs]= plotcurrent(dataCont, ix, iy, iData )
    if nargin <= 0
        error('input_example :  data is a required input')
    end
    [nData, ~]=size(dataCont.data);
    if(nData==0) 
        return
    end
    if nargin == 4
        if(isa(iData, 'char') || isa(iData, 'string'))
            matches=regexp(dataCont.names, iData, 'once');
            k=1;
            for i=1:size(matches, 1)
                if(max(size(matches{i}))>0)
                    dataNums(k)=i; %#ok
                    k=k+1;
                end
            end
        else
            dataNums=iData;
        end
        nPlots=max(size(dataNums));
    end
    if nargin <= 3
        nPlots=nData;
        dataNums=1:nPlots;
        if nargin <= 2
            iy=zeros(max(dataNums),1)+2;
            if nargin <= 1
                ix=zeros(max(dataNums),1)+1;
            end
        end
    end
    if nargin >= 2
        if(isa(ix, 'char') || isa(ix, 'string'))
            colName=ix;
            ix=zeros(max(dataNums), 1);
            for i=1:nPlots
                ix(dataNums(i))=dataCont.colIndexByColName{dataNums(i)}(colName);
            end
        end
        if nargin >=3
            if(isa(iy, 'char') || isa(iy, 'string'))
                colName=iy;
                iy=zeros(max(dataNums), 1);
                for i=1:nPlots
                    iy(dataNums(i))=dataCont.colIndexByColName{dataNums(i)}(colName);
                end
            end
        end
    end
    
    leglines=4;
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
    markerSizes={25, 10, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8};
    markerEdgeColors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
    markerFaceColors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
    fitLineStyles={'--', ':', '-.', '-'};
    fitLineWidths={2, 2, 2, 2};
    fitLineJoins={'round', 'round', 'round'};

    for iPlot=1:nPlots
        iDatum=dataNums(iPlot);

        X=dataCont.data{iDatum}(:,ix(iDatum));
        Y=dataCont.data{iDatum}(:,iy(iDatum));

        % sort
        s = [X Y];
        s = sortrows(s,1);
        X = s(:, 1);
        Y = s(:, 2);

        % plot1
        plot1 = plot(X, Y);
        set(plot1, 'LineStyle', getcircled(lineStyles, iPlot));
        set(plot1, 'LineWidth', getcircled(lineWidths, iPlot));
        set(plot1, 'Color', getcircled(colors, iPlot));
        set(plot1, 'Marker', getcircled(markers, iPlot));
        set(plot1, 'MarkerSize', getcircled(markerSizes, iPlot));
        set(plot1, 'MarkerEdgeColor', getcircled(markerEdgeColors, iPlot));
        set(plot1, 'MarkerFaceColor', getcircled(markerFaceColors, iPlot));


        fitobj{iDatum}=fit(X, Y,'exp1');
        fit1Plot=plot(fitobj{iDatum});
        fitcoeffs{iDatum}=coeffvalues(fitobj{iDatum}); %#ok<*SAGROW>
        fiterrs{iDatum}=confint(fitobj{iDatum});
        set(fit1Plot, 'LineStyle', getcircled(fitLineStyles, iPlot));
        set(fit1Plot, 'LineWidth', getcircled(fitLineWidths, iPlot));
        set(fit1Plot, 'LineJoin', getcircled(fitLineJoins, iPlot));
        set(fit1Plot, 'Color', getcircled(colors, iPlot));

        leg{leglines*(iPlot-1)+1}=dataCont.names{iDatum};
        leg{leglines*(iPlot-1)+2}='fit a*e^b^x:';
        leg{leglines*(iPlot-1)+3}=['a = ' num2str(fitcoeffs{iDatum}(1), format)...
            '±' num2str(abs(fiterrs{iDatum}(1,1)-fiterrs{iDatum}(2,1))/2, formaterr)];
        leg{leglines*(iPlot-1)+4}=['T_0 = ' num2str(1/fitcoeffs{iDatum}(2), format)...
            '±' num2str(abs(fiterrs{iDatum}(1,2)-fiterrs{iDatum}(2,2))/2, formaterr)...
            '°C'];
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
    title(['Dependence of ' dataCont.colNames{dataNums(1)}{iy(dataNums(1))} ' on ' dataCont.colNames{dataNums(1)}{ix(dataNums(1))}]);
    xlabel([dataCont.colNames{dataNums(1)}{ix(dataNums(1))} ' [' dataCont.colUnits{dataNums(1)}{ix(dataNums(1))} ']']);
    ylabel([dataCont.colNames{dataNums(1)}{iy(dataNums(1))} ' [' dataCont.colUnits{dataNums(1)}{iy(dataNums(1))} ']']);
    hold off;
end 