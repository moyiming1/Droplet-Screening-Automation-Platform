function [index,reagentLoc,reagentVol,sampleName,cvScanrate,cvVoltage1,cvVoltage2,cvCycle,reactionTemp,expInfo] = readExpPara(expPath)
%% Version history
% v0.1: Created by Yiming Mo 01/20/2019
%
%% Input: 
% expPath: experiment folder


%% Output:
% reagentLoc
% reagentVol
% sampleName


%% 
fileName = strcat(expPath,'\Experiment parameter.xlsx');

%check whether file exists
if isfile(fileName)==0
    error('File not exist.');
end

% read file
[num,txt,data] = xlsread(fileName);

%detect how many vials are used
vialNo = find(strcmp(data(1,:), 'Scan rate (V/s)'))-3;
vialNo = int64(vialNo);
%set the reagent vial location
reagentLoc = num(1,1:vialNo);

%find the unfinished experiment
finishColumnNo = find(strcmp(data(1,:), 'Finished?'))-2;
unfinishedSample = find(num(2:end,finishColumnNo)==0);



%check whether it is all finished
if isempty(unfinishedSample)==0
    index = unfinishedSample(1);
    % read sample name
    sampleName = char(data(index+2,1));
    
    % read sample volumes
    reagentVol = num(index+1,1:vialNo);
    % read reaction parameters
    cvScanrate = num(index+1,vialNo+1);
    cvVoltage1 = num(index+1,vialNo+2);
    cvVoltage2 = num(index+1,vialNo+3);
    cvCycle = num(index+1,vialNo+4);
    reactionTemp = num(index+1,vialNo+5);
    
    %the info for the experiment
    expInfo="<-------------------------------------------------\n";
    expInfo = expInfo + 'SampleName:                ' + sampleName + '\n';
    expInfo = expInfo + 'Vial location:             ' + num2str(reagentLoc,'%-6d') + '\n';
    expInfo = expInfo + 'Vial volume(ul):           ' + num2str(reagentVol,'%-6.1f') + '\n';
    expInfo = expInfo + 'Scan rate (V/s):           ' + num2str(cvScanrate) + '\n';
    expInfo = expInfo + 'Potential vertex 1 (V):    ' + num2str(cvVoltage1) + '\n';
    expInfo = expInfo + 'Potential vertex 2 (V):    ' + num2str(cvVoltage2) + '\n';
    expInfo = expInfo + 'Cycles:                    ' + num2str(cvCycle) + '\n';
    expInfo = expInfo + 'Temperature (C):           ' + num2str(reactionTemp) + '\n';
    expInfo = expInfo +'------------------------------------------------->\n';
    expInfo = compose(expInfo);
    expInfo = convertStringsToChars(expInfo);
else
    index = 0;
    % read sample name
    sampleName = 'No sample';
    % read sample volumes
    reagentVol = zeros(1,vialNo);
    % read reaction parameters
    cvScanrate = 0.15;
    cvVoltage1 = -0.5;
    cvVoltage2 = -.5;
    cvCycle = 2;
    reactionTemp = 20;
    expInfo="<-------------------------------------------------\n";
    expInfo = expInfo +'Experiments done!\n';
    expInfo = expInfo +'------------------------------------------------->\n';
    expInfo = compose(expInfo);
    expInfo = convertStringsToChars(expInfo);
end


end
