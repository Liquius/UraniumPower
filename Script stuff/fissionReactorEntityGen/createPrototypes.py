


templateFile = open('template.txt','r')
templateData = templateFile.read()


# name
# collision_box
# selection_box
# fluid_box
    

def makePrototype( xSize, ySize ):

    name = 'nuclear-fission-reactor-%i-by-%i' % ( xSize, ySize )

    cBox = (  -0.29 - xSize/2.0, -0.29 - ySize/2.0, 0.29 + xSize/2.0, 0.29 + ySize/2.0 )
    sBox = (  -0.5 - xSize/2.0, -0.5 - ySize/2.0, 0.5 + xSize/2.0, 0.5 + ySize/2.0 )
    fBox = (  -0.5 - xSize/2.0, -0.5 - ySize/2.0, 0.5 + xSize/2.0, 0.5 + ySize/2.0 )

    p = templateData

    p += '    name = "%s",\n' % (name)
    p += '    collision_box = {{%0.2f,%0.2f},{%0.2f,%0.2f}},\n' % cBox
    p += '    selection_box = {{%0.2f,%0.2f},{%0.2f,%0.2f}},\n' % sBox
#    p += '    fluid_box = {{%0.2f,%0.2f},{%0.2f,%0.2f}}\n' % fBox
    p += '},\n'
    
    return p

output = ''

for i in range(3,7):
    for j in range(3,7):
        output += makePrototype( i, j )
    
f = open('prototypes.txt','w')
f.write( output )
f.close()
