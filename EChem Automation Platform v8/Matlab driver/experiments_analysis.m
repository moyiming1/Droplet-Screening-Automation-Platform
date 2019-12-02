function experiments_analysis(expPath,index,HPLCdataFolder)
%% version history
% v0.1 created by Yiming Mo 01/21/2019

%% description
% for obtaining data from HPLC and modifying experimental parameter excel
% potentially for optimizing --> propose new reactions to do and add into
% excel sheet

% inputs:
% expPath: experiments path
% index: current sample index in the excel sheet

fileName = strcat(expPath,'\Experiment parameter.xlsx');

% read file
[num,txt,data] = xlsread(fileName);

%detect how many vials are used
vialNo = find(strcmp(data(1,:), 'Temperature (C)'))-3;

%change current sample to finsihed
data{index+2,vialNo+8}=1;

% calculate the experiment results
% HPLCdataFolder
% data{index+2,vialNo+9}=yield;

% propose new reaction to do

xlswrite(fileName,data);

end