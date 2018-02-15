%open files
fileData1 = fopen('Calibration.txt','r');
fileData2 = fopen('Unknown gas.txt','r');
fileData3 = fopen('data1.txt','r');
fileData4 = fopen('data2.txt','r');
fileData5 = fopen('data3.txt','r');

%setting formats
format = '%f';

%read files
Y=fscanf(fileData1,'%c', 30)';
Init=fscanf(fileData1,'%f', 1)';
Calib=fscanf(fileData1,'%f', [3 inf])';
unk=fscanf(fileData2,'%f %f', [2 inf]);
data3=fscanf(fileData3,'%f', [2 inf])';
data4=fscanf(fileData4,'%f', [2 inf])';
data5=fscanf(fileData5,'%f', [2 inf])';
