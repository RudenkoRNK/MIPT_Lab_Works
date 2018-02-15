%open files
fileData1 = fopen('data1.txt','r');
fileData2 = fopen('data2.txt','r');
fileData3 = fopen('data3.txt','r');
fileData4 = fopen('data4.txt','r');
fileData5 = fopen('data5.txt','r');

%setting formats
format = '%f';

%read files
data1=fscanf(fileData1,format, [2 inf])';
data2=fscanf(fileData2,format, [2 inf])';
data3=fscanf(fileData3,format, [2 inf])';
data4=fscanf(fileData4,format, [2 inf])';
data5=fscanf(fileData5,format, [2 inf])';