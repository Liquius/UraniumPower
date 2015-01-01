


def makePrototype(x):

	p = ''

	p += 'uranium-pellet-%02i=Uranium Oxide Pellet %.01fxxx235\n' %(x, -0.3+x*0.5)
	return p

output1 = ''

for i in range(1,11):
	output1 += makePrototype(i)
    
f = open('output.txt','w')
f.write( output1 )
f.close()
