# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 2.5

trianglefill 0 115 6 190 -6 190
thickline 0 190 0 240 6
#trianglefill 10 180 20 280 0 280
#trianglefill -10 180 10 180 0 280
#trianglefill -10 180 0 280 -20 280
#trianglefill 130 0 180 -10 180 10

setrangeanglemin 0
setrangeanglemax 1.5

pitchladder
ammotype 20kwk30ap 1500
pos 0
range 0
triangle 0 0 2.25 -3.5 -2.25 -3.5
triangle -4 0 -5.25 -2 -2.75 -2
triangle -8 0 -9.25 -2 -6.75 -2
triangle -12 0 -13.25 -2 -10.75 -2
triangle 4 0 2.75 -2 5.25 -2
triangle 8 0 6.75 -2 9.25 -2
triangle 12 0 10.75 -2 13.25 -2
#thinline -4 0 -5.25 -2
#thinline -4 0 -2.75 -2
#thinline -8 0 -9.25 -2
#thinline -8 0 -6.75 -2
#thinline -12 0 -13.25 -2
#thinline -12 0 -10.75 -2
#thinline 4 0 2.75 -2
#thinline 4 0 5.25 -2
#thinline 8 0 6.75 -2
#thinline 8 0 9.25 -2
#thinline 12 0 10.75 -2
#thinline 12 0 13.25 -2

setrangeanglemax -1.5

#pos 125
pos 113
pitchscale 50
angleoffset 90
anglerangeon
textscaley 0.15
range 0
text 0 0.05 8 0 o
range 100
text 0 0.05 8 0 o
range 200
text 0 0.05 8 0 o
range 300
text 0 0.05 8 0 o
range 400
text 0 0.05 8 0 o
range 500
text 0 0.05 8 0 o
range 600
text 0 0.05 8 0 o
range 700
text 0 0.05 8 0 o
range 800
text 0 0.05 8 0 o
range 900
text 0 0.05 8 0 o
range 1000
text 0 0.05 8 0 o
range 1100
text 0 0.05 8 0 o
range 1200
text 0 0.05 8 0 o
textscaley 1.0

textscalex 0.15
range 700
text 8 0 8 -90 2.0cm
textscalex 0.18
range 0
text -8 0 8 -90 0
range 200
text -8 0 8 -90 2
range 400
text -8 0 8 -90 4
range 600
text -8 0 8 -90 6
range 800
text -8 0 8 -90 8
range 1000
text -8 0 8 -90 10
range 1200
text -8 0 8 -90 12

textscalex 1.0

anglerangeoff
endpitchladder



setrangeanglemin 0
setrangeanglemax 0


# fov should be last as it draws the main border circle cutout
fov 25