clear;
%open files
fileData1 = fopen('data.txt','r');
fileData2 = fopen('data2.txt','r');

%setting formats
format = '%f';

%read files
data1=fscanf(fileData1,format, [4 inf])';
data2=fscanf(fileData2,format, [5 inf])';


%common
phi = (data1(:,1)+data1(:,2)/60+data1(:,3)/3600)/360*2*pi;
lambda = data1(:,4);
X1 = lambda;
Y1 = sin(phi);
phi2 = (data2(:,1)+data2(:,2)/60+data2(:,3)/3600)/360*2*pi;
lambda2 = data2(:,4);
[s, ~] = size(phi2);
X2 = zeros(s/2, 1);
Y2 = zeros(s/2, 1);
for i=1:s/2
    X2(i) = data2(2*i, 5);
    Y2(i) = (phi2(2*i) - phi2(2*i-1))/(lambda2(2*i) - lambda2(2*i-1));
end
