function newMethodXml=insertWait(methodXml,waitTime)

drawXml=fileread('Template\insertWait.xml');

waitTimeStr=buildXmlStr('<WaitTime>');

drawXml=modifyValue(drawXml,waitTimeStr,num2str(waitTime));

endLoc=strfind(methodXml,'<');

newMethodXml=insertAfter(methodXml,endLoc(end)-1,drawXml(3:end));

end
