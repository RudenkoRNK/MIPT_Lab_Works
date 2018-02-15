%open files
comfiles=dir('num2*.txt');
vacfiles=dir('VAC*.txt');
[NV, ~]=size(vacfiles);
[N, ~]=size(comfiles);

comni=containers.Map; % common name indices
comnames=cell(N,1);
comdata=cell(N,1);
for i=1:N
    name=comfiles(i).name;
    file=fopen(name ,'r');
    comnames{i}=name(1:regexp(name, '\.txt')-1);
    comni(comnames{i})=i;
    comdata{i}=fscanf(file,'%f', [2 inf])';
    fclose(file);
end

angind=comni('num2angle');
wvind=comni('num2wavelength');
[s, ~]=size(comdata{angind});
calibt=zeros(s, 2);
it=1;
for i=1:s
    ind = find(comdata{wvind}(:,1)==comdata{angind}(i, 1));
    if ind
        calibt(it, 1)=comdata{wvind}(ind, 2);
        calibt(it, 2)=comdata{angind}(i, 2);
        it=it+1;
    end
end
if(s~=it)
    calib=zeros(it-1, 2);
    for i=1:it-1
        calib(i,1)=calibt(i,1);
        calib(i,2)=calibt(i,2);
    end
else
    calib=calibt;
end

vacni=containers.Map;
vacnames=cell(NV,1);
vacdata=cell(NV,1);
angles=zeros(NV,1);
for i=1:NV
    name=vacfiles(i).name;
    file=fopen(name ,'r');
    vacnames{i}=name(1:regexp(name, '\.txt')-1);
    vacni(vacnames{i})=i;
    angles(i)=fscanf(file, '%f', 1);
    vacdata{i}=fscanf(file,'%f', [2 inf])';
    fclose(file);
end