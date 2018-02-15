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
    
    properties
        data
        names
        colNames
        colUnits
        iDatumByName
        colIndexByColName
    end
    
    methods
        function obj=DataContainer()
            obj.iDatumByName=containers.Map;
        end
        %% parsing
        function parsefiles(obj, fileExt, skipRows)
            if nargin <= 2
                skipRows=0;
            end
            if nargin <= 1
                fileExt='*.txt';
            end
            files=dir(fileExt);
            nFiles=length(files);
            
            % reverse indexing order for implicit memory allocation
            initSize=size(obj.data, 2);
            for i=nFiles:-1:1
                obj.parsefile(files(i).name, skipRows, initSize+i);
            end
        end
        
        function parsefile(obj, file, skipRows, iDatum)
            if nargin <= 2
                skipRows=0;
            end
            if nargin <= 3
                iDatum=size(obj.data, 2);
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
            if(isa(colheaders, 'double')); colheaders = DataContainer.createdummycolheaders(size(datum, 2)); end
            
            % generating data name
            dotsPos=regexp(file,'\.');
            if(isempty(dotsPos)); endPos=length(file); else; endPos=max(1, dotsPos(end)-1); end
            name=file(1:endPos);
            
            % finishing
            obj.add_datum(datum, name, colheaders, iDatum);
        end
        
        %% modifying
        function add_datum(obj, datum, name, colheaders, iDatum)
            if nargin <= 4
                iDatum=size(obj.data, 2);
                iDatum=iDatum+1;
            end
            obj.names{iDatum}=name;
            obj.iDatumByName(obj.names{iDatum})=iDatum;
            obj.data{iDatum}=datum;
            nCols=size(obj.data{iDatum}, 2);
            if(~(isa(colheaders,'string') || (isa(colheaders, 'cell') && isa(colheaders{1}, 'char'))))
                colheaders=DataContainer.createdummycolheaders(nCols);
            end
            obj.colNames{iDatum}=cell(nCols,1);
            obj.colIndexByColName{iDatum}=containers.Map;
            obj.colUnits{iDatum}=cell(nCols,1);
            for i=nCols:-1:1
                name_unit=DataContainer.parsecolheader(colheaders{i});
                obj.colNames{iDatum}{i}=name_unit{1};
                obj.colUnits{iDatum}{i}=name_unit{2};
                obj.colIndexByColName{iDatum}(name_unit{1})=i;
            end
        end
        
        function add_column(obj, column, iDatum, colheader)
            if nargin <= 3
                name_unit=DataContainer.createdummytitles(1);
            else
                name_unit=DataContainer.parsecolheader(colheader);
            end
            if(~isa(iDatum, 'double'))
                iDatum=obj.iDatumByName(iDatum);
            end
            nRows =size(obj.data{iDatum}, 2);
            obj.data{iDatum}=[obj.data{iDatum} column];
            obj.colIndexByColName{iDatum}(name_unit{1})=nRows+1;
            obj.colNames{iDatum}{nRows+1}=name_unit{1};
            obj.colUnits{iDatum}{nRows+1}=name_unit{2};
        end
    end
    methods (Access = public, Static)
        %% accessory
        function name_unit=parsecolheader(title)
            out = regexp(title,'(^.*?)(?:\:|\,)(.*$)','tokens');
            name_unit=strings(1,2);
            if(length(out)==1)
                name_unit=out{1};
            elseif(~isempty(title))
                name_unit{1}=title;
                name_unit{2}='';
            else
                name_unit{1}=['dummy' num2str(randi(100))];
                name_unit{2}='';
            end
            name_unit=strtrim(name_unit);
        end
        
        function titles=createdummycolheaders(n)
            titles=cell(n, 1);
            for i=1:n
                titles{i}=['dummy' num2str(i)];
            end
        end
    end
end