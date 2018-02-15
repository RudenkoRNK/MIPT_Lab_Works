clear;
%open files
fileData1 = fopen('data.txt','r');
fileData2 = fopen('data2.txt','r');

%setting formats
format = '%f';

%read files
Y=fscanf(fileData1,format, [4 inf])';
data2=fscanf(fileData2,format, [2 inf])';


%common
[k, n] = size(Y);
X = (-3:3)';