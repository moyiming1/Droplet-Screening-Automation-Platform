function newMethodXml=insertMoveNeedleToSeat(methodXml)

drawXml=fileread('Template\insertMoveNeedleToSeat.xml');

endLoc=strfind(methodXml,'<');

newMethodXml=insertAfter(methodXml,endLoc(end)-1,drawXml(3:end));

end
