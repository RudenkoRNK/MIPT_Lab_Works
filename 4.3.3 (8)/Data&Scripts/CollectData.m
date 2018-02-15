clear;
%open files
fileData0 = fopen('data.txt','r');
fileData1 = fopen('dErr.txt','r');

%setting formats
format = '%f';

%read files
data1=fscanf(fileData0,format, [2 inf])';
data2=fscanf(fileData1,format, [1 inf])';


%common
d = data1(:, 1);
D = data1(:, 2);
dErr = data2;
