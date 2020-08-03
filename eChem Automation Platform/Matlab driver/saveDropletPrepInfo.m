function saveDropletPrepInfo(reagentLoc,reagentVol,sampleName,samplePrepTime,expPath)
%% version info
%created by Yiming Mo v0.1 01/2019

%% function description
%save the droplet preparation information into an excel file
%vector from LabView is row vector
%reagentLoc
%reagentVol
%sampleName
%samplePrepTime
%expPath

% if the excel file doesn't exist, it will create the file.
% if it exists, it will append to the end of the file.

%% save the info
% check whether excel file exists, if not create one
fileName = strcat(expPath,'\Droplet Info.xlsx');

if isfile(fileName)==0
    xlswrite(fileName,{'Droplet injected information','';'Sample name','Sample time'});
end

[num,txt,data] = xlsread(fileName);


data(end+1,1:3) = {sampleName,samplePrepTime,'Location'};
data(end+1,3) = {'Volume (ul)'};

data(end-1,4:length(reagentLoc)+3) = num2cell(reagentLoc);
data(end,4:length(reagentVol)+3) = num2cell(reagentVol);

xlswrite(fileName,data);
end