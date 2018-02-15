%open files
files=dir('*.txt');
format = '%f';
[N, ~]=size(files);
nameinds=containers.Map;
names=cell(N,1);
data=cell(N,1);

width=zeros(N,1);
density=zeros(N,1);

for i=1:N
    name=files(i).name;
    file=fopen(name ,'r');
    names{i}=name(1:regexp(name, '\.txt')-1);
    nameinds(names{i})=i;
    
    width(i)=fscanf(file, format, 1);
    density(i)=fscanf(file, format, 1);
    data{i}=fscanf(file,format, [2 inf])';
    fclose(file);
end