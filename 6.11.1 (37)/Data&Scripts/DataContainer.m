classdef DataContainer < handle
    % Here is the model:                           %
    % ---------------Data Container--------------- %
    % ------name{1}-------....-------name{N}------ % [datum index by name]
    % ------data{1}-------....-------data{N}------ %
    % -col(1)-...-col(n1)-....-col(1)-...-col(nN)- %
    %                                              %
    % ----colNames{1}-----....-----colNames{N}---- % [column index by name]
    % name{1}-...-name{n1}....name{1}-...-name{nN} %
    %                                              %
    % ----colUnits{1}-----....-----colUnits{N}---- %
    % unit{1}-...-unit{n1}....unit{1}-...-unit{nN} %
    %                                              %
    % ---coliErrors{1}----....---coliErrors{N}---- % determines index of error column
    % iErr(1)-...-iErr(n1)....iErr(1)-...-iErr(nN) % for given column
    
    properties
        data
        names
        colNames
        colUnits
        coliErrors
        iDatumByName
        iColumnByName
    end
    
    methods
        function dc=DataContainer()
            dc.iDatumByName=containers.Map;
        end
        %% parsing
        function parsefiles(dc, fileExt, skipRows)
            if(~exist('fileExt','var'))
                fileExt='*.txt';
            end
            if(~exist('skipRows','var'))
                skipRows=0;
            end
            files=dir(fileExt);
            nFiles=length(files);
            
            % reverse indexing order for implicit memory allocation
            initSize=size(dc.data, 2);
            for i=nFiles:-1:1
                dc.parsefile(files(i).name, skipRows, initSize+i);
            end
        end
        
        function parsefile(dc, file, skipRows, iDatum)
            if(~exist('skipRows','var'))
                skipRows=0;
            end
            if(~exist('iDatum','var'))
                iDatum=size(dc.data, 2);
                iDatum=iDatum+1;
            end
            
            % import data and generate colheaders
            A=importdata(file);
            colheaders=0;
            if(isa(A,'double'))
                datum=A;
            else
                datum=A.data;
                if(isfield(A,'colheaders'))
                    colheaders=A.colheaders;
                end
            end
            if(skipRows>0); datum=datum(skipRows+1:end, :); end
            if(isa(colheaders, 'double')); colheaders = DataContainer.generateDummyColheaders(size(datum, 2)); end
            
            % generating data name
            dotsPos=regexp(file,'\.');
            if(isempty(dotsPos)); endPos=length(file); else; endPos=max(1, dotsPos(end)-1); end
            name=file(1:endPos);
            
            % finishing
            dc.addDatum(datum, name, colheaders, iDatum);
        end
        
        %% modifying
        function iDatum=addDatum(dc, datum, name, colheaders, iDatum)
            if(~exist('iDatum','var'))
                iDatum=size(dc.data, 2);
                iDatum=iDatum+1;
            end
            if(~isa(dc.names,'string')); dc.names=string(); end
            dc.names(iDatum)=string(name);
            dc.iDatumByName(dc.names{iDatum})=iDatum;
            dc.data{iDatum}=datum;
            nCols=size(dc.data{iDatum}, 2);
            if(~(isa(colheaders,'string') || (isa(colheaders, 'cell') && isa(colheaders{1}, 'char'))))
                colheaders=DataContainer.generateDummyColheaders(nCols);
            end
            dc.colNames{iDatum}=strings(1,nCols);
            dc.colUnits{iDatum}=strings(1,nCols);
            dc.coliErrors{iDatum}=zeros(1, nCols);
            dc.iColumnByName{iDatum}=containers.Map;
            for i=nCols:-1:1
                name_unit=DataContainer.parseColheader(colheaders{i});
                dc.colNames{iDatum}(i)=name_unit(1);
                dc.colUnits{iDatum}(i)=name_unit(2);
                dc.iColumnByName{iDatum}(name_unit{1})=i;
            end
        end
        
        function [iColumn, iErrColumn]=...
                addColumn(dc, column, iDatum, colheader, errorcolumn, errorcolheader)
            if(~exist('colheader','var'))
                colheader=DataContainer.generateDummyColheaders(1);
            end
            if(~exist('errorcolheader','var'))
                errorcolheader=DataContainer.generateErrColheader(colheader);
            end
            name_unit=DataContainer.parseColheader(colheader);
            iDatum=dc.getiDatum(iDatum);
            dc.data{iDatum}=[dc.data{iDatum} column];
            iColumn=size(dc.data{iDatum}, 2);
            dc.iColumnByName{iDatum}(name_unit{1})=iColumn;
            dc.colNames{iDatum}(iColumn)=name_unit(1);
            dc.colUnits{iDatum}(iColumn)=name_unit(2);
            dc.coliErrors{iDatum}(iColumn)=0;
            if(exist('errorcolumn','var'))
                iErrColumn=dc.addErrorColumn(errorcolumn, iDatum, iColumn, errorcolheader);
            end
        end
        
        function iErrColumn=addErrorColumn(dc, errorcolumn, iDatum, iColumn, colheader)
            iDatum=dc.getiDatum(iDatum);
            iColumn=dc.getiColumn(iDatum, iColumn);
            
            if(~exist('colheader','var'))
                colheader=DataContainer.generateErrColheader(...
                    dc.colNames{iDatum}(iColumn)+","+dc.colUnits{iDatum}(iColumn));
            end
            if(length(errorcolumn)==1)
                 errorcolumn=zeros(size(dc.data{iDatum},1),1)+errorcolumn;
            end
            
            iErrColumn=dc.addColumn(errorcolumn, iDatum, colheader);
            dc.markErrorColumn(iDatum, iColumn, iErrColumn);
        end
        
        function markErrorColumn(dc, iDatum, iColumn, iErrColumn)
            iDatum=dc.getiDatum(iDatum);
            iColumn=dc.getiColumn(iDatum, iColumn);
            iErrColumn=dc.getiColumn(iDatum, iErrColumn);
            dc.coliErrors{iDatum}(iColumn)=iErrColumn;
        end
        
        %% accessing
        function iData=getiData(dc, iData)
            % retuns datum indexes by regex pattern or index iDatum
            if(~isa(iData, 'double'))
                iData=DataContainer.getmatchnums(dc.names, iData);
            end
        end
        
        function iDatum=getiDatum(dc, iDatum)
            iDatum=dc.getiData(iDatum);
            assert(length(iDatum)<=1, 'Arguments define more than one iDatum');
            assert(length(iDatum)==1, 'Arguments do not define iDatum');
        end
        
        function [iColsRes, iDataRes]=getiColumns(dc, iData, iColumns)
            % retuns column-datum pair indexes by regex pattern or index
            iData=dc.getiData(iData);
            iColsRes=[];
            iDataRes=[];
            for i=1:length(iData)
                if(~isa(iColumns, 'double'))
                    res=DataContainer.getmatchnums(dc.colNames{iData(i)}, iColumns);
                else; res=iColumns; 
                end
                iColsRes=[iColsRes res];                                    %#ok
                iDataRes=[iDataRes (zeros(1,length(res))+iData(i))];   %#ok
            end
        end
        
        function [iColumn, iDatum]=getiColumn(dc, iDatum, iColumn)
            [iColumn, iDatum]=dc.getiColumns(iDatum, iColumn);
            assert(length(iColumn)<=1, 'Arguments define more than one reference column');
            assert(length(iColumn)==1, 'Arguments do not reference column');
        end
        
        function col=gc(dc, iDatum, iColumn)
            % get column
            [iColumn, iDatum]=getiColumn(dc, iDatum, iColumn);
            col=dc.data{iDatum}(:,iColumn);
        end
            
    end
    methods (Access = private, Static)
        %% accessories
        function name_unit=parseColheader(colheader)
            out = regexp(colheader,'(^.*?)(?:\:|\,)(.*$)','tokens');
            name_unit=strings(1,2);
            if(length(out)==1)
                name_unit=string(out{1});
            elseif(~isempty(colheader))
                name_unit(1)=colheader;
                name_unit(2)='';
            else
                name_unit(1)=['dummy' num2str(randi(100))];
                name_unit(2)='';
            end
            name_unit=strtrim(name_unit);
        end
        
        function errcolheader=generateErrColheader(colheader)
            name_unit=DataContainer.parseColheader(colheader);
            errcolheader=name_unit(1)+" error," + name_unit(2);
        end
        
        function titles=generateDummyColheaders(n)
            titles=strings(n, 1);
            for i=1:n
                titles{i}=['dummy' num2str(i)];
            end
        end
        
        function res = getmatchnums(arr, expression)
            %returns array of all indexes where regexp succeed
            res=[];
            matches=regexp(arr, expression, 'once');
            k=1;
            for i=1:length(matches)
                if(~isempty(matches{i}))
                    res(k)=i; %#ok
                    k=k+1;
                end
            end
        end
    end
end