function newMethodXml=insertDrawVial(methodXml,drawVol,drawLoc,drawSpeed)

drawXml=fileread('Template\insertDrawVial.xml');

volStr=buildXmlStr('<VolumeValue>');
locStr=buildXmlStr('<LocationString>[[');
SpeedStr=buildXmlStr('<SpeedValue>');

drawXml=modifyValue(drawXml,volStr,num2str(drawVol));
drawXml=modifyValue(drawXml,locStr,num2str(drawLoc));
drawXml=modifyValue(drawXml,SpeedStr,num2str(drawSpeed));

endLoc=strfind(methodXml,'<');

newMethodXml=insertAfter(methodXml,endLoc(end)-1,drawXml(3:end));

end
