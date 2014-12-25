

templateFile = open('template.txt','r')
templateData = templateFile.read()




def makePrototype( x ):

    p = ''

    p += '      {\n'
    p += '        type = "unlock-recipe",\n'
    p += '        recipe = "fuel-assembly-%02i"\n' %(x)
    p += '      },\n'

    p += '      {\n'
    p += '        type = "unlock-recipe",\n'
    p += '        recipe = "uranium-pellet-%02i"\n' %(x)
    p += '      },\n'

    p += '      {\n'
    p += '        type = "unlock-recipe",\n'
    p += '        recipe = "uranium-hexafluoride-%02i"\n' %(x)
    p += '      },\n'

    
    return p

output = ''

for i in range(1,11):
    output += makePrototype( i )
    
f = open('output.txt','w')
f.write( templateData + output )
f.close()