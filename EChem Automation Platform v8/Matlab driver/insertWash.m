function newMethodXml=insertWash(methodXml,washLoc,washCycles)

drawXml=fileread('Template\insertWash.xml');

cyclesStr=buildXmlStr('<Cycles>');
locStr=buildXmlStr('<LocationString>[[');

drawXml=modifyValue(drawXml,cyclesStr,num2str(washCycles));
drawXml=modifyValue(drawXml,locStr,num2str(washLoc));

endLoc=strfind(methodXml,'<');

newMethodXml=insertAfter(methodXml,endLoc(end)-1,drawXml(3:end));

end
