%open files
fileData1 = fopen('data1.txt','r');
fileData2 = fopen('data2.txt','r');
fileData3 = fopen('data3.txt','r');

%setting formats
format = '%f';

%read files
data1=fscanf(fileData1,format, [3 inf])';
data2=fscanf(fileData2,format, [2 inf])';
data3=fscanf(fileData3,format, [2 inf])';
