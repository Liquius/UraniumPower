

templateFile = open('template.txt','r')
templateData = templateFile.read()




def makePrototype( xSize, ySize ):

    name = 'nuclear-fission-reactor-chest-%i' % ( xSize * ySize )

    p = templateData

    p += '    name = "%s",\n' % (name)
    p += '    inventory_size = %i\n' % (xSize * ySize)
    p += '  },\n'
    
    return p

output = ''

for i in range(3,7):
    for j in range(3,7):
        output += makePrototype( i, j )
    
f = open('output.txt','w')
f.write( output )
f.close()