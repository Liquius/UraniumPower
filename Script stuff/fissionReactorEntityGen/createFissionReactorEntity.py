


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

    if xSize%2 == 0 and ySize%2 == 0:
        return ''



    if xSize%2 == 0:
        x1CBox = 0.2 - xSize/2.0 +0.5
        x2CBox = -0.2 + xSize/2.0 +0.5
        x1SBox = -xSize/2.0 +0.5
        x2SBox = xSize/2.0 +0.5
        xSizePos = xSize/2
        xSizeNeg = -xSize/2+2
        ySizePos2 = ySize/2+1
        ySizeNeg2 = -ySize/2
    else:
        x1CBox = 0.2 - xSize/2.0
        x2CBox = -0.2 + xSize/2.0
        x1SBox = -xSize/2.0
        x2SBox = xSize/2.0
        xSizePos = xSize/2+1
        xSizeNeg = -xSize/2+1
        ySizePos2 = ySize/2+1
        ySizeNeg2 = -ySize/2


    if ySize%2 == 0:
        y1CBox = 0.2 - ySize/2.0 +0.5
        y2CBox = -0.2 +ySize/2.0 +0.5
        y1SBox = -ySize/2.0 +0.5
        y2SBox = ySize/2.0 +0.5
        ySizePos = ySize/2
        ySizeNeg = -ySize/2+2
        xSizePos2 = xSize/2+1
        xSizeNeg2 = -xSize/2
    else:
        y1CBox = 0.2 - ySize/2.0
        y2CBox = -0.2 +ySize/2.0
        y1SBox = -ySize/2.0
        y2SBox = ySize/2.0
        ySizePos = ySize/2+1
        ySizeNeg = -ySize/2+1
        xSizePos2 = xSize/2+1
        xSizeNeg2 = -xSize/2



    name = 'nuclear-fission-reactor-%i-by-%i' % ( xSize, ySize )



    p = templateData

    p += '    name = "%s",\n' % (name)
    p += '    collision_box = {{%0.2f,%0.2f},{%0.2f,%0.2f}},\n' % (x1CBox, y1CBox, x2CBox, y2CBox)
    p += '    selection_box = {{%0.2f,%0.2f},{%0.2f,%0.2f}},\n' % (x1SBox, y1SBox, x2SBox, y2SBox)
    p += '    fluid_box =\n'
    p += '    {\n'
    p += '      base_area = %i,\n' %((xSize-1) * (ySize-1))
    p += '      pipe_connections =\n'
    p += '      {\n'

    if ySize%2 > 0:    
        for f in range(xSizeNeg, xSizePos):
            p += '        {position= {%i, %i}},\n' %(f, ySizePos2)
            p += '        {position= {%i, %i}},\n' %(f, ySizeNeg2)

    p += '\n'

    if xSize%2 > 0:
        for f in range(ySizeNeg, ySizePos):
            p += '        {position= {%i, %i}},\n' %(xSizePos2, f)
            p += '        {position= {%i, %i}},\n' %(xSizeNeg2, f)
    


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
