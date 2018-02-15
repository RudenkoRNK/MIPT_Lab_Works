%open files
data=DataContainer;
data.parsefiles();
data.add_column(data.data{1}(:,4)*1000/43,'TonPow','\DeltaT,K');
data.add_column(data.data{1}(:,2).*data.data{1}(:,3),...
               'TonPow','SamplePower,W');
data.add_column(data.data{1}(:,2)*0.001+data.data{1}(:,3)*0.005,...
               'TonPow','SamplePowerErr,W');

plotseriesVAC(data, ["Current$"],...
                    {'Voltage.$'},...
                    {'VAC'});
plotseries(data, "SamplePower$", "DeltaT", "TonPow");