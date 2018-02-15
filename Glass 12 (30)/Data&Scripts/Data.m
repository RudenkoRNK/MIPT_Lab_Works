classdef Data
    % Here is the Data model:                      %
    % --------------------Data-------------------- %
    % ------name{1}-------....-------name{N}------ %
    % ------data{1}-------....-------data{N}------ %
    % -col(1)-...-col(n1)-....-col(1)-...-col(nN)- %
    %                                              %
    % ----colNames{1}-----....-----colNames{N}---- %
    % name{1}-...-name{n1}....name{1}-...-name{nN} %
    %                                              %
    % ----colUnits{1}-----....-----colUnits{N}---- %
    % unit{1}-...-unit{n1}....unit{1}-...-unit{nN} %
    
    
    properties
        data
        names
        indexByName
        colNames
        colIndexByColName
        colUnits
    end
    
    methods
        function obj = parsefiles(obj)
            files=[dir('*.txt') dir('*.dat')];
            [nFiles, ~]=size(files);
            obj.data=cell(nFiles,1);
            obj.names=cell(nFiles,1);
            obj.indexByName=containers.Map;
            for i=1:nFiles
                obj=obj.parsefile(files(i).name, i);
            end
        end
        
        function obj = parsefile(obj, file, iData)
            name=file(1:regexp(file, '\.(?:txt|dat)')-1);
            A=importdata(file);
            colTitles=0;
            if(isa(A,'double'))
                dat=A;
            else
                dat=A.data;
                if(isfield(A,'colheaders'))
                    colTitles=A.colheaders;
                end
            end
            obj=obj.add(dat, name, colTitles, iData);
        end
        
        function obj = add(obj, data, name, colTitles, iData)
            if nargin <= 4
                [iData, ~]=size(obj.data);
                iData=iData+1;
            end
            obj.data{iData}=data;
            obj.names{iData}=name;
            obj.indexByName(obj.names{iData})=iData;
            [~, nCols]=size(obj.data{iData});
            if(isa(colTitles,'double'))
                colTitles=Data.createdummytitles(nCols);
            end
            obj.colNames{iData}=cell(nCols,1);
            obj.colIndexByColName{iData}=containers.Map;
            obj.colUnits{iData}=cell(nCols,1);
            for i=1:nCols
                name_unit=Data.parsetitle(colTitles{i});
                obj.colNames{iData}{i}=name_unit{1};
                obj.colIndexByColName{iData}(name_unit{1})=i;
                obj.colUnits{iData}{i}=name_unit{2};
            end
        end
    end
    
    methods (Access = private, Static)
        function name_unit=parsetitle(title)
            out = regexp(title,'(^.*?)\:(.*$)','tokens');
            name_unit=cell(2,1);
            if(max(size(out))==1)
                name_unit=out{1};
            elseif(max(size(title))>0)
                name_unit{1}=title;
                name_unit{2}='';
            else
                name_unit{1}=['dummy' num2str(randi(100))];
                name_unit{2}='';
            end
        end
        
        function titles=createdummytitles(n)
            titles=cell(n, 1);
            for i=1:n
                titles{i}=['dummy' num2str(i)];
            end
        end
    end
end