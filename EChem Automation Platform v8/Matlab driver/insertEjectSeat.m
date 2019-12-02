function newMethodXml=insertEjectSeat(methodXml,ejectVol,ejectSpeed)

drawXml=fileread('Template\insertEjectSeat.xml');

volStr=buildXmlStr('<VolumeValue>');
SpeedStr=buildXmlStr('<SpeedValue>');

drawXml=modifyValue(drawXml,volStr,num2str(ejectVol));
drawXml=modifyValue(drawXml,SpeedStr,num2str(ejectSpeed));

endLoc=strfind(methodXml,'<');

newMethodXml=insertAfter(methodXml,endLoc(end)-1,drawXml(3:end));

end
