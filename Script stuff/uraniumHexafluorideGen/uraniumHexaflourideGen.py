

templateFile = open('template.txt','r')
templateData = templateFile.read()




def makePrototype( x ):

    p = templateData

    p += '    name = "uranium-hexafluoride-%02i",\n' % ( x )
    p += '    icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride-%02i.png"\n' % ( x )
    p += '  },\n'
    
    return p

output = ''

for i in range(1,11):
    output += makePrototype( i )
    
f = open('output.txt','w')
f.write( output )
f.close()