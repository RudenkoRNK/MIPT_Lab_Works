%open files
fileData1 = fopen('data1.txt','r');
fileData2 = fopen('data2.txt','r');

%setting formats
format = '%f';

%read files
data1=fscanf(fileData1,format, [2 inf])';
data2=fscanf(fileData2,format, [2 inf])';
X1=data1(:,2);
Y1=data1(:,1);
X2=data2(:,2);
Y2=data2(:,1);