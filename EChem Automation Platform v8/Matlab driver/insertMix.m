function newMethodXml=insertMix(methodXml,mixVol,mixLoc,mixSpeed,cycles)

newMethodXml = methodXml;

for i = 1:cycles
    newMethodXml = insertDrawVial(newMethodXml,mixVol,mixLoc,mixSpeed);
    newMethodXml = insertEjectVial(newMethodXml,mixVol,mixLoc,mixSpeed);
end

end
