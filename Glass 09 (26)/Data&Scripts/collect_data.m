%open files
fileData1 = fopen('dark1.txt','r');
fileData2 = fopen('dark2.txt','r');
fileData3 = fopen('spe.txt','r');
fileData4 = fopen('spe_info.txt','r');

%setting formats
format = '%f';

%read files
data1=fscanf(fileData1,format, [2 inf])';
data2=fscanf(fileData2,format, [2 inf])';
data3=fscanf(fileData3,format, [2 inf])';
data4=fscanf(fileData4,format, [inf])';

dark1=data1;
dark2=data2;
spe=data3;
spe=spe-(dark1+dark2)/2;
freqmin=data4(6);
freqstep=16;
freqmax=data4(7)*freqstep+freqmin;
freq=(freqmin:freqstep:freqmax)';

peakcoords=[9.51e4 1.07e5 1.312e5;...
            9.515e4 1.079e5 1.313e5];
peakvalues=zeros(2, 3);
wavelengths=[1529.3 1367.1 1128.3];
