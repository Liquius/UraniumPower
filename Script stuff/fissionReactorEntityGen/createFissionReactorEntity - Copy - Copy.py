


templateFile = open('template.txt','r')
templateData = templateFile.read()


#    fluid_box =
#    {
#      base_area = 2,
#
#      pipe_connections =
#      {
#        { position = {1, -2} },
#        { position = {0, -2} },
#        { position = {-1, -2} },
#        { position = {2, 1} },
#        { position = {2, 0} },
#        { position = {2, -1} },
#        { position = {1, 2} },
#        { position = {0, 2} },
#        { position = {-1, 2} },
#        { position = {-2, 1} },
#        { position = {-2, 0} },
#        { position = {-2, -1} }
#      },
#    },



def makePrototype( xSize, ySize ):


    if xSize%2 == 0:
        return ''

    if ySize%2 == 0:
        return ''

    name = 'nuclear-fission-reactor-%i-by-%i' % ( xSize, ySize )

    cBox = (0.2 - xSize/2.0, 0.2 - ySize/2.0, -0.2 + xSize/2.0, -0.2 +ySize/2.0)
    sBox = (-xSize/2.0, -ySize/2.0, xSize/2.0, ySize/2.0)

    p = templateData

    p += '    name = "%s",\n' % (name)
    p += '    collision_box = {{%0.2f,%0.2f},{%0.2f,%0.2f}},\n' % cBox
    p += '    selection_box = {{%0.2f,%0.2f},{%0.2f,%0.2f}},\n' % sBox
    p += '    fluid_box =\n'
    p += '    {\n'
    p += '      base_area = %i,\n' %(max(xSize, ySize))
    p += '      pipe_connections =\n'
    p += '      {\n'
    

    for f in range(-xSize/2+1, xSize/2+1):
        p += '        {position= {%i, %i}},\n' %(f, ySize/2+1)
        p += '        {position= {%i, %i}},\n' %(f, -ySize/2)

    p += '\n'

    for f in range(-ySize/2+1, ySize/2+1):
        p += '        {position= {%i, %i}},\n' %(xSize/2+1, f)
        p += '        {position= {%i, %i}},\n' %(-xSize/2, f)
    


    p += '      }\n'
    p += '    }\n'
    p += '  },\n'
    
    return p

output = ''

for i in range(3,7):
    for j in range(3,7):
        output += makePrototype( i, j )
    
f = open('prototypes.txt','w')
f.write( output )
f.close()
