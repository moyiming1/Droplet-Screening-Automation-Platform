function newMethodXml=modifyValue(methodXml,valueTag,newValue)

valueTagLoc=strfind(methodXml,valueTag);

valueLoc=valueTagLoc+length(valueTag);

newMethodXml=insertAfter(methodXml,valueLoc-1,buildXmlStr(newValue));

end