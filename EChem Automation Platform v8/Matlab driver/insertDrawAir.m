function newMethodXml=insertDrawAir(methodXml,drawVol,drawSpeed)

drawXml=fileread('Template\insertDrawAir.xml');

volStr=buildXmlStr('<VolumeValue>');
SpeedStr=buildXmlStr('<SpeedValue>');

drawXml=modifyValue(drawXml,volStr,num2str(drawVol));
drawXml=modifyValue(drawXml,SpeedStr,num2str(drawSpeed));

endLoc=strfind(methodXml,'<');

newMethodXml=insertAfter(methodXml,endLoc(end)-1,drawXml(3:end));

end
