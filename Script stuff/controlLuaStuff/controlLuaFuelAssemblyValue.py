


def makePrototype(x):

	p = ''

	p += 'fuelAssemblyValue%02i = %.03f\n' %(x, x/14.00)
	return p

output1 = ''

for i in range(1,11):
	output1 += makePrototype(i)
    
f = open('output1.txt','w')
f.write( output1 )
f.close()
