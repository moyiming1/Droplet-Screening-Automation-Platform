%build the string format for xml file
function xmlStr=buildXmlStr(str)

s = fileread('Template\xmlSpace.xml');

xmlSpace = s(4);

xmlStr = [];

for i = 1:length(str)
    xmlStr = [xmlStr,str(i),xmlSpace];
end

end