%open files
fileData1 = fopen('data.txt','r');

%setting formats
format = '%f';

%read files
data=fscanf(fileData1,format, [2 inf])';
X1=1-cos(data(:,1)/360*2*pi);
Y1=1./data(:,2);