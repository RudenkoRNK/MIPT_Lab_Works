classdef DataContainer
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
    
    %% properties
    properties
        data
        names
        colNames
        colUnits
        iDatumByName
        colIndexByColName
    end
    
    %% methods
    methods
        %% parsing
        function obj = parsefiles(obj, fileExt, skipRows)
            if nargin <= 2
                skipRows=0;
            end
            if nargin <= 1
                fileExt='*.txt';
            end
            files=dir(fileExt);
            [nFiles, ~]=size(files);
            obj.data=cell(nFiles, 1);
            obj.names=cell(nFiles, 1);
            obj.colNames=cell(nFiles, 1);
            obj.colUnits=cell(nFiles, 1);
            obj.colIndexByColName=cell(nFiles, 1);
            obj.iDatumByName=containers.Map;
            for i=1:nFiles
                obj=obj.parsefile(files(i).name, i, skipRows);
            end
        end
        
        function obj = parsefile(obj, file, iDatum, skipRows)
            if nargin <= 3
                skipRows=0;
            end
            if nargin <= 2
                [iDatum, ~]=size(obj.data);
                iDatum=iDatum+1;
            end
            A=importdata(file);
            colheaders=0;
            dotsPos=regexp(file,'\.');
            if(max(size(dotsPos))==0); endPos=size(file, 2); else; endPos=max(1, dotsPos(end)-1); end
            name=file(1:endPos);
            if(isa(A,'double'))
                datum=A;
            else
                datum=A.data;
                if(isfield(A,'colheaders'))
                    colheaders=A.colheaders;
                end
            end
            if(skipRows>0); datum=datum(skipRows+1:end, :); end
            obj=obj.add_datum(datum, name, colheaders, iDatum);
        end
        
        %% modifying
        function obj = add_datum(obj, datum, name, colheaders, iDatum)
            if nargin <= 4
                iDatum=size(obj.data, 1);
                iDatum=iDatum+1;
            end
            obj.data{iDatum}=datum;
            obj.names{iDatum}=name;
            obj.iDatumByName(obj.names{iDatum})=iDatum;
            nCols=size(obj.data{iDatum}, 2);
            if(isa(colheaders,'double'))
                colheaders=DataContainer.createdummytitles(nCols);
            end
            obj.colNames{iDatum}=cell(nCols,1);
            obj.colIndexByColName{iDatum}=containers.Map;
            obj.colUnits{iDatum}=cell(nCols,1);
            for i=1:nCols
                name_unit=DataContainer.parsetitle(colheaders{i});
                obj.colNames{iDatum}{i}=name_unit{1};
                obj.colUnits{iDatum}{i}=name_unit{2};
                obj.colIndexByColName{iDatum}(name_unit{1})=i;
            end
        end
        
        function obj = add_column(obj, column, iDatum, name, unit)
            if nargin <= 4
                unit='';
            end
            if nargin <= 3
                name=DataContainer.createdummytitles(1){1};
            end
            nRows =size(obj.data{iDatum}, 2);
            obj.data{iDatum}=[obj.data{iDatum} column];
            obj.colIndexByColName{iDatum}(name)=nRows+1;
            obj.colNames{iDatum}{nRows+1}=name;
            obj.colUnits{iDatum}{nRows+1}=unit;
        end
    end
    methods (Access = private, Static)
        %% accessory
        function name_unit=parsetitle(title)
            out = regexp(title,'(^.*?)(?:\:|\,)(.*$)','tokens');
            name_unit=cell(2, 1);
            if(max(size(out))==1)
                name_unit=out{1};
            elseif(max(size(title))>0)
                name_unit{1}=title;
                name_unit{2}='';
            else
                name_unit{1}=['dummy' num2str(randi(100))];
                name_unit{2}='';
            end
            name_unit=strtrim(name_unit);
        end
        
        function titles=createdummytitles(n)
            titles=cell(n, 1);
            for i=1:n
                titles{i}=['dummy' num2str(i)];
            end
        end
    end
end