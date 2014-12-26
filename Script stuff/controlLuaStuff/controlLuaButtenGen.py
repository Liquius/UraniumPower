


def makePrototype( xSize, ySize ):

	p = '		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor%iBy%i", caption = {"%i By %i"}})\n' % ( xSize, ySize, xSize, ySize )

	return p

output = ''

for i in range(3,7):
    for j in range(3,7):
        output += makePrototype( i, j )
    
f = open('Butten.txt','w')
f.write( output )
f.close()