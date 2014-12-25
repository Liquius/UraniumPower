

templateFile = open('template.txt','r')
templateData = templateFile.read()




def makePrototype( x ):

    p = templateData

    p += '    name = "fuel-assembly-%02i",\n' % ( x )
    p += '    ingredients =\n'
    p += '    {\n'
    p += '      {"uranium-pellet-%02i", 50},\n' % ( x )
    p += '      {"steel-plate", 2}\n'
    p += '    },\n'
    p += '    result = "fuel-assembly-%02i"\n' % ( x )
    p += '  },\n'
    
    return p

output = ''

for i in range(1,11):
    output += makePrototype( i )
    
f = open('output.txt','w')
f.write( output )
f.close()