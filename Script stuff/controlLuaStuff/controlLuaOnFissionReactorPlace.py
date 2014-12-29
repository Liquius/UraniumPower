

def makePrototype( xSize, ySize ):

	p = '	elseif event.createdentity.name == "nuclear-fission-reactor-chest-%i" then\n' %(xSize*ySize)
	p += '		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-%i-by-%i"}\n' %(xSize, ySize)
	p += '		if #results == 1 then\n'
	p += '			if glob.LReactorAndChest == nil then\n'
	p += '				glob.LReactorAndChest = {}\n'
	p += '			end\n'
	p += '			reactorAndChest = {true, true, true}\n'
	p += '			reactorAndChest[1] = results[1]\n'
	p += '			reactorAndChest[2] = event.createdentity\n'
	p += '			reactorAndChest[3] = 0\n'
	p += '			table.insert(glob.LReactorAndChest, reactorAndChest)\n'
	p += '			game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")\n'
	p += '		else\n'
	p += '			event.createdentity.destroy()\n'
	p += '			game.player.insert({name = "nuclear-fission-reactor-chest-%i", count = 1})\n' %(xSize*ySize)
	p += '			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")\n'
	p += '		end\n'

	return p

output = ''

for i in range(3,7):
    for j in range(3,7):
        output += makePrototype( i, j )
    
f = open('OnFissionReactorPlace.txt','w')
f.write( output )
f.close()

