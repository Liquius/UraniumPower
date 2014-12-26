

def makePrototype( xSize, ySize ):

	p = '		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-%i-by-%i"}) ~= nil then\n' %(xSize, ySize)
	p += '			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-%i-by-%i"})\n' %(xSize, ySize)

	return p

output = ''

for i in range(3,7):
    for j in range(3,7):
        output += makePrototype( i, j )
    
f = open('OnFissionReactorPlace.txt','w')
f.write( output )
f.close()