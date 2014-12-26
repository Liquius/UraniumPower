
templateFile = open('template.txt','r')
templateData = templateFile.read()




def makePrototype( x ):

    p = templateData

    p += '    name = "uranium-hexafluoride-%02i",\n' % ( x )
    p += '    icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride-%02i.png",\n' % ( x )
    p += '    ingredients =\n'
    p += '    {\n'
    p += '      {type="fluid", name="uranium-hexafluoride-%02i", amount=20}\n' % ( x )
    p += '    },\n'
    p += '    results =\n'
    p += '    {\n'
    p += '      {type="fluid", name="uranium-hexafluoride-%02i", amount=10},\n' % ( x + 1 )
    p += '      {type="fluid", name="uranium-hexafluoride-%02i", amount=10}\n' % ( x - 1 )
    p += '    }\n'
    p += '  },\n'
    
    return p

output = ''

for i in range(2,10):
    output += makePrototype( i )
    
f = open('output.txt','w')
f.write( output )
f.close()