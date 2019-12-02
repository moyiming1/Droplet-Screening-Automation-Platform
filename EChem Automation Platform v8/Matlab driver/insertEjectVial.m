function newMethodXml=insertEjectVial(methodXml,ejectVol,ejectLoc,ejectSpeed)

drawXml=fileread('Template\insertEjectVial.xml');

volStr=buildXmlStr('<VolumeValue>');
locStr=buildXmlStr('<LocationString>[[');
SpeedStr=buildXmlStr('<SpeedValue>');

drawXml=modifyValue(drawXml,volStr,num2str(ejectVol));
drawXml=modifyValue(drawXml,locStr,num2str(ejectLoc));
drawXml=modifyValue(drawXml,SpeedStr,num2str(ejectSpeed));

endLoc=strfind(methodXml,'<');

newMethodXml=insertAfter(methodXml,endLoc(end)-1,drawXml(3:end));

end
