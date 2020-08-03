function newMethodXml=insertWaitFor(methodXml)

drawXml=fileread('Template\insertWaitFor.xml');

endLoc=strfind(methodXml,'<');

newMethodXml=insertAfter(methodXml,endLoc(end)-1,drawXml(3:end));

end
