%open files
fileData1 = fopen('data.txt','r');

%setting formats
format = '%f';

%read files
data=fscanf(fileData1,format, [2 inf])';
X1=data(:, 1);
Y1=data(:, 2);