%open files
data=DataContainer;
data=data.parsefiles('*.txt');
for i=1:size(data.data,1)
    data=data.add_column(data.data{i}(:, 2)/0.95/2000*10000, i, 'Power', 'mW');
end

[A, fitCoeffs, C]=plotpower(data, 'Current', 'Power', '\d+');
EHN=1.2525;
i_th=zeros(size(fitCoeffs,1), 1);
eff=zeros(size(fitCoeffs,1), 1);
T=str2double(string(data.names));
T=T(1:size(fitCoeffs,1));
for i=1:size(fitCoeffs,1)
    i_th(i)=-fitCoeffs{i}(2)/fitCoeffs{i}(1);
    eff(i)=fitCoeffs{i}(1)*EHN*100;
end
data=data.add_datum([T i_th eff], 'Threshold current',...
    {'Temperature, °C', 'Threshold current, mA', 'Differential Quantum Efficiency, %'});
plotcurrent(data, 'Temperature', 'Threshold current', 'Threshold');
plotefficiency(data, 'Temperature', 'Differential Quantum Efficiency', 'Threshold');
