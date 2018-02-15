fileUNu0= fopen('U(nu) 0 ohm.txt','r');
fileUNu1 = fopen('U(nu) 100 ohm.txt','r');
format = '%f';
UNu0=fscanf(fileUNu0,format, [2 inf])';
UNu1=fscanf(fileUNu1,format, [2 inf])';
U0=UNu0(:,1)*3/10;
nu0=UNu0(:,2);
U1=UNu1(:,1)*3/100;
nu1=UNu1(:,2);

[t, ~] = size (U0);
U0Err = zeros(t,1)+0.03;
[t, ~] = size (U1);
U1Err = zeros(t,1)+0.003;