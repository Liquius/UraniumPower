templateFile = open('OnGuiButtonClickTemplate.txt','r')
templateData = templateFile.read()


def makePrototype( xSize, ySize ):

	p = '	elseif event.clickgui == fissionReactor%iBy%i then\n' %(xSize, ySize)

	p += templateData

	p += '		game.player.insert({name = "fission-reactor-%i-by-%i", count = 1})\n' %(xSize, ySize)

	return p

output = ''

for i in range(3,7):
    for j in range(3,7):
        output += makePrototype( i, j )
    
f = open('OnGuiButtonClick.txt','w')
f.write( output )
f.close()