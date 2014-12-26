
import Image, ImageDraw

# Draws a progress bar on top of the image and returns the new image
def drawBar( img, fraction ):

    emptyColour   = '#0000FF'
    fullColour    = '#FFFF00'
    outlineColour = '#777777'
    
    W = 256
    H = 256

    # Blow up the image from 32 to 256
    img = img.resize( (W,H) )

    # Create a drawing canvas on the image
    draw = ImageDraw.Draw(img)

    def relToAbs( x, y ):
        return ( x*W, y*H )

    # Draw the two rectangles
    draw.rectangle([relToAbs(0.0, 0.8), relToAbs(1, 0.9)],        fill=emptyColour )
    draw.rectangle([relToAbs(0.0, 0.8), relToAbs(fraction, 0.9)], fill=fullColour )

    # Draw the outline
    draw.line([relToAbs(0, 0.8), relToAbs(1, 0.8)], fill=outlineColour, width=16 )
    draw.line([relToAbs(0, 0.9), relToAbs(1, 0.9)], fill=outlineColour, width=16 )
    draw.line([relToAbs(0, 0.8), relToAbs(0, 0.9)], fill=outlineColour, width=16 )
    draw.line([relToAbs(1, 0.8), relToAbs(1, 0.9)], fill=outlineColour, width=16 )

    # Resize back to 32x32 with antialiasing
    img = img.resize( (32,32), Image.ANTIALIAS )

    return img


template = Image.open( 'uranium-pellet-template.png' )

# Total number of pictures
n = 10

for i in range(0, n):

    fraction = (i+1)/float(n)
    img = drawBar( template, fraction )
    img.save('output/Pellet/uranium-pellet-%02i.png' % (i+1), 'PNG')
