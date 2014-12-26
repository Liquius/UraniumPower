


def makePrototype(x):

	p = ''

	p += '					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue%02i * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-%02i"}))\n' %(x, x)
	return p

output = ''

for i in range(1,11):
	output += makePrototype(i)
    
f = open('CalcFuel.txt','w')
f.write( output )
f.close()
