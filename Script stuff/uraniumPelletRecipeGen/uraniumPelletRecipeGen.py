

templateFile = open('template.txt','r')
templateData = templateFile.read()




def makePrototype( x ):

    p = templateData

    p += '    name = "uranium-pellet-%02i",\n' % ( x )
    p += '    ingredients =\n'
    p += '    {\n'
    p += '      {type="fluid", name="uranium-hexafluoride-%02i", amount=5}\n' % ( x )
    p += '    },\n'
    p += '    results =\n'
    p += '    {\n'
    p += '      {type="item", name="uranium-pellet-%02i", amount=1}\n' % ( x )
    p += '    }\n'
    p += '  },\n'
    
    return p

output = ''

for i in range(1,11):
    output += makePrototype( i )
    
f = open('output.txt','w')
f.write( output )
f.close()