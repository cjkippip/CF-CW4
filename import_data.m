% Computational Finance
% coursework 4
% import and clean data

%%
SP_Struct = importdata('data/SP500.csv');
SP_Close_plus1=SP_Struct.data(1:241,4);

SP_Ret=log(SP_Close_plus1(1:end-1)./SP_Close_plus1(2:end));
SP_Ret=flipud(SP_Ret(1:240)); % SP return

SP_Close=SP_Close_plus1(1:end-1);
SP_Close=flipud(SP_Close(1:240)); % SP close price

PMI_Struct = importdata('data/PMI.xls');
PMI=PMI_Struct.data; % PMI










