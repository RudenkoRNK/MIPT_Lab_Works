function [fitObjs, ix, iy, iDataX, iDataY] = ...
        plotseries(varargin)
    %% parse arguments
    [dc, ix, iy, iDataX, iDataY, iSubplots, gridSize]=parsearguments(varargin);
    
    %% plot
    nPlots=length(iDataX);
    fitObjs={};
    figure;
    s=1; e=1;
    iSubplot=1;
    for i=2:nPlots+1
        if(i==nPlots+1 || ~isequal(iSubplots{i}, iSubplots{i-1}))
            switch iSubplot
                case 1
                    fitObjs=cat(1,fitObjs,...
                        plotsubplot1(dc, ix(s:e), iy(s:e), iDataX(s:e), iDataY(s:e), iSubplots{e}, gridSize));
                case 2
                    fitObjs=cat(1,fitObjs,...
                        plotsubplot1(dc, ix(s:e), iy(s:e), iDataX(s:e), iDataY(s:e), iSubplots{e}, gridSize));
                otherwise
                    fitObjs=cat(1,fitObjs,...
                        plotsubplot1(dc, ix(s:e), iy(s:e), iDataX(s:e), iDataY(s:e), iSubplots{e}, gridSize));
            end
            iSubplot=iSubplot+1;
            s=i; e=i;
        else
            e=e+1;
        end
    end
end 

function [fitObjs] = plotsubplot1(dc, ix, iy, iDataX, iDataY, iSubplot, gridSize)    
    nPlots=length(ix);
    
    %% setup fit
    leglines=3;
    fitType='poly1';
    fitOpts = fitoptions( 'Method', 'LinearLeastSquares', 'Exclude', 1:10);
    
    fitNCoeffs=2;
    fitObjs=cell(nPlots, 1);
    fitCoeffs=zeros(nPlots,fitNCoeffs);
    fitConfInts=zeros(nPlots,fitNCoeffs, 2);
    leg=cell(nPlots*leglines, 1);

    %% setup styles
    lineStyles={'none', 'none', 'none', 'none'};
    lineWidths={2, 2, 2, 2};
    colors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
    markers={'.', '+', 'x', '^', 'v', 'x', 'd', '^', 'v', '>', '<', 'p', 'h', 's'};
    markerSizes={1, 10, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8};
    markerEdgeColors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
    markerFaceColors={'k', 'r', 'b', 'g', 'c', 'm', 'y', 'w'};
    fitLineStyles={'--', ':', '-.', '-'};
    fitLineWidths={2, 2, 2, 2};
    fitLineJoins={'round', 'round', 'round'};
    format='%+5.1f';
    formaterr='%5.1f';

    %% make new space
    subplot1=subplot(gridSize(1), gridSize(2), iSubplot);
    subplot1.XScale='linear';
    subplot1.YScale='linear';
    subplot1.GridLineStyle='-';
    %subplot1....
    hold on;
    grid on;

    %%
    for iPlot=1:nPlots
        iDatumX=iDataX(iPlot);
        iDatumY=iDataY(iPlot);
        iyErr=dc.coliErrors{iDatumY}(iy(iPlot));
        X=dc.data{iDatumX}(:,ix(iPlot));
        Y=dc.data{iDatumY}(:,iy(iPlot));
        if(iyErr>0) 
            YErr=dc.data{iDatumY}(:,iyErr);
            fitOpts.Weights = 1./YErr;
        else; YErr=zeros(length(Y),1);
        end
        [X, Y, YErr]=prepareCurveData(X, Y, YErr);
        
        % sort
        s = [X Y YErr];
        s = sortrows(s,1);
        X = s(:, 1);
        Y = s(:, 2);
        YErr=s(:,3);

        % plot1
        if(iyErr>0); plot1=errorbar(X, Y, YErr);
        else; plot1 = plot(X, Y); end
        
        set(plot1, 'LineStyle', getcircled(lineStyles, iPlot));
        set(plot1, 'LineWidth', getcircled(lineWidths, iPlot));
        set(plot1, 'Color', getcircled(colors, iPlot));
        set(plot1, 'Marker', getcircled(markers, iPlot));
        set(plot1, 'MarkerSize', getcircled(markerSizes, iPlot));
        set(plot1, 'MarkerEdgeColor', getcircled(markerEdgeColors, iPlot));
        set(plot1, 'MarkerFaceColor', getcircled(markerFaceColors, iPlot));

        % fit1
        fitObjs{iPlot}=fit(X, Y, fitType, fitOpts);
        fit1Plot=plot(fitObjs{iPlot});
        fitCoeffs(iPlot, :)=coeffvalues(fitObjs{iPlot});
        fitConfInts(iPlot, :, :) = confint(fitObjs{iPlot})';
        set(fit1Plot, 'LineStyle', getcircled(fitLineStyles, iPlot));
        set(fit1Plot, 'LineWidth', getcircled(fitLineWidths, iPlot));
        set(fit1Plot, 'LineJoin', getcircled(fitLineJoins, iPlot));
        set(fit1Plot, 'Color', getcircled(colors, iPlot));

        leg{leglines*(iPlot-1)+1}=dc.names{iDatumY}; % dc.colNames{iDatumY}{iy(iPlot)};
        leg{leglines*(iPlot-1)+2}='linear fit a*x+b:';
        theta=-fitCoeffs(iPlot, 2)/fitCoeffs(iPlot, 1);
        aerr=abs(fitConfInts(iPlot,1,1)-fitConfInts(iPlot,1,2))/2;
        berr=abs(fitConfInts(iPlot,2,1)-fitConfInts(iPlot,2,2))/2;
        thetaerr=theta*(abs(aerr/fitCoeffs(iPlot, 1))+abs(berr/fitCoeffs(iPlot, 2)));
        
        leg{leglines*(iPlot-1)+3}=['\Theta = ' num2str(theta, format)...
            '±' num2str(thetaerr, formaterr)];
        for iter=1:leglines-2
            plotx=plot(X(1), Y(1));
            plotx.Marker='none';
            plotx.LineStyle='none';
        end
    end

    %% legend
    l=legend(leg, 'FontSize', 10, 'TextColor', 'black');
    l.TextColor='k';
    l.Color = 'w';
    l.Box = 'on';
    l.EdgeColor = [0.15 0.15 0.15];
    l.LineWidth = 0.5;
    l.Location ='best';

    %% final
    iDatumX=iDataX(1);
    iDatumY=iDataY(1);
    title(['Dependence of ' dc.colNames{iDatumY}{iy(1)} ' on ' dc.colNames{iDatumX}{ix(1)}]);
    xlabel([dc.colNames{iDatumX}{ix(1)} ' [' dc.colUnits{iDatumX}{ix(1)} ']']);
    ylabel([dc.colNames{iDatumY}{iy(1)} ' [' dc.colUnits{iDatumY}{iy(1)} ']']);
    hold off;
end

%% support functions
function [dc, ix, iy, iDataX, iDataY, iSubplots, gridSize] = parsearguments(varargin)
    ip=inputParser;
    ip.PartialMatching=false;
    if(length(varargin{1})>1 && ~isa(varargin{1}{2}, 'char'))
        nClauses=length(varargin{1}{2});
    else; nClauses=1;
    end
    
    % default and dummy values
    defaultix=cell(1, nClauses); defaultix(:)={1};
    defaultiy=cell(1, nClauses); defaultiy(:)={2};
    defaultiData=cell(1, nClauses); defaultiData(:)={'.'};
    defaultiSubplots=cell(1, nClauses); defaultiSubplots(:)={1};
    dummyGridSize=[0 0];
    dummyiDataY=cell(1, nClauses); dummyiDataY(:)={0};
    
    % validations
    validDC=@(x)isa(x,'DataContainer');
    validClauses=  @(x) (isa(x, 'double') || isa(x, 'string') || isa(x, 'cell'))...
                        &&(length(x)==nClauses);
    validiSubplots=@(x) (isa(x, 'double') || isa(x, 'cell'))&&(length(x)==nClauses);
    validGridSize= @(x) isvector(x) && length(x)==2;
    
    % constructing and parsing
    ip.addRequired('dc', validDC);
    ip.addOptional('iData', defaultiData, validClauses);
    ip.addOptional('ix', defaultix, validClauses);
    ip.addOptional('iy', defaultiy, validClauses);
    ip.addOptional('iSubplots', defaultiSubplots, validiSubplots);
    ip.addParameter('gridSize', dummyGridSize, validGridSize);
    ip.addParameter('mixWithinDatum', true, @(x) isa(x,'logical'));
    ip.addParameter('iDataY', dummyiDataY, validClauses);
    ip.parse(varargin{:}{:});
    r=ip.Results;
    
    % conversions
    if(isa(r.ix, 'double')); r.ix=num2cell(r.ix); end
    if(isa(r.iy, 'double')); r.iy=num2cell(r.iy); end
    if(isa(r.iData, 'double')); r.iData=num2cell(r.iData); end
    if(isa(r.iSubplots, 'double')); r.iSubplots=num2cell(r.iSubplots); end
    
    % redefining dummy values
    if(isequal(r.gridSize,dummyGridSize));  r.gridSize=[max(cell2mat(r.iSubplots)), 1]; end
    if(isequal(r.iDataY,dummyiDataY));  r.iDataY=r.iData;
    elseif(r.mixWithinDatum); warning(['iDataY was passed but X and Y mesh only within same iDatum '...
                                       'due to mixWithinDatum is true. '...
                                       'iDataY ignored']);
    end
    if(isa(r.iDataY, 'double')); r.iDataY=num2cell(r.iDataY); end
    
    % initiate result variables
    dc=r.dc; ix=[]; iy=[]; iDataX=[]; iDataY=[]; iSubplots={}; gridSize=r.gridSize;
    
    % parsing
    for i=1:nClauses
        if(~r.mixWithinDatum)
            iDataClauseX=r.iData{i};
            iDataClauseY=r.iDataY{i};
            ixClause=r.ix{i};
            iyClause=r.iy{i};
            [ixClause, iDataClauseX]=dc.getiColumns(iDataClauseX, ixClause);
            [iyClause, iDataClauseY]=dc.getiColumns(iDataClauseY, iyClause);
            [X, Y]=meshgrid(ixClause, iyClause);
            [DataX, DataY]=meshgrid(iDataClauseX, iDataClauseY);
            ix=cat(1, ix, X(:));
            iy=cat(1, iy, Y(:));
            iDataX=cat(1, iDataX, DataX(:));
            iDataY=cat(1, iDataY, DataY(:));
            iSubplots=cat(1, iSubplots, cell(length(X(:)),1));
            iSubplots(end-length(X(:))+1:end)=r.iSubplots(i);
        else
            iDataClause=r.iData{i};
            iDataClause=dc.getiData(iDataClause);
            for k=1:length(iDataClause)
                iDatum=iDataClause(k);
                ixClause=r.ix{i};
                iyClause=r.iy{i};
                ixClause=dc.getiColumns(iDatum, ixClause);
                iyClause=dc.getiColumns(iDatum, iyClause);
                [X, Y]=meshgrid(ixClause, iyClause);
                ix=cat(1, ix, X(:));
                iy=cat(1, iy, Y(:));
                iDataX=cat(1, iDataX, zeros(length(X(:)),1)+iDatum);
                iDataY=cat(1, iDataY, zeros(length(X(:)),1)+iDatum);
                iSubplots=cat(1, iSubplots, cell(length(X(:)),1));
                iSubplots(end-length(X(:))+1:end)=r.iSubplots(i);
            end
        end
    end
end

function [res] = getcircled(cellarr, k)
    s = length(cellarr);
    ind = mod(k, s);
    if ind==0
        ind=s;
    end
    res=cellarr{ind};
end