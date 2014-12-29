templateFile = open('OnGuiButtonClickTemplate.txt','r')
templateData = templateFile.read()


def makePrototype( xSize, ySize ):



	p = '	elseif event.element.name == "fissionReactor%iBy%i" then\n' %(xSize, ySize)
	p += '		game.player.insert({name = "nuclear-fission-reactor-chest-%i", count = 1})\n' %(xSize*ySize)
	p += '		game.player.insert({name = "nuclear-fission-reactor-%i-by-%i", count = 1})\n' %(xSize, ySize)
	p += '		nuclearFissionReactorKit.destroy()\n'
	p += '		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")\n'
	p += '		game.player.gui.center.fissionReactorTable.destroy()\n'

	return p

output = ''

for i in range(3,7):
    for j in range(3,7):
        output += makePrototype( i, j )
    
f = open('OnGuiButtonClick.txt','w')
f.write( output )
f.close()
