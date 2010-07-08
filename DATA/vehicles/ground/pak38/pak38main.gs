# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 2.8

trianglefill 0 86 6 136 -6 136
thickline 0 136 0 250 6
thinline -0.02 130 -0.02 150

setrangeanglemin 0
setrangeanglemax 3.55

pitchladder
ammotype 5cm38l60_pzgr_patr38 1400
pos 0
range 0
triangle 0 0 2.25 -3.5 -2.25 -3.5
triangle -4 0 -5.25 -2 -2.75 -2
triangle -8 0 -9.25 -2 -6.75 -2
triangle -12 0 -13.25 -2 -10.75 -2
triangle 4 0 2.75 -2 5.25 -2
triangle 8 0 6.75 -2 9.25 -2
triangle 12 0 10.75 -2 13.25 -2

setrangeanglemax -3.55

pos 77
pitchscale 90
angleoffset 90
anglerangeon
textscaley 0.5
textscalex 0.07
text -1.5 -1 12 -90 Pzgr
range 300
text 0 0 10 -90 o
range 500
text 0 0 10 -90 o
range 600
text 0 0 10 -90 o
range 700
text 0 0 10 -90 o
range 800
text 0 0 10 -90 o
range 900
text 0 0 10 -90 o
range 1000
text 0 0 10 -90 o
range 1100
text 0 0 10 -90 o
range 1200
text 0 0 10 -90 o
range 1300
text 0 0 10 -90 o
range 1400
text 0 0 10 -90 o
range 1500
text 0 0 10 -90 o
range 0
text -5 0 10 -90 0
range 500
text -5 0 10 -90 5
range 800
text -5 0 10 -90 8
range 1000
text -5 0 10 -90 10
range 1200
text -5 0 10 -90 12
range 1400
text -5 0 10 -90 14

textscaley 1
textscalex 1

anglerangeoff
endpitchladder

pitchladder
ammotype 5cm38l60_sprgr_patr38 2400

pos 86
pitchscale 30
angleoffset 90
anglerangeon
textscaley 0.5
textscalex 0.19
text -1.3 -3.2 12 -90 Sprgr
range 0
text 0 0 10 -90 o
range 400
text 0 0 10 -90 o
range 500
text 0 0 10 -90 o
range 600
text 0 0 10 -90 o
range 700
text 0 0 10 -90 o
range 800
text 0 0 10 -90 o
range 900
text 0 0 10 -90 o
range 1000
text 0 0 10 -90 o
range 1100
text 0 0 10 -90 o
range 1200
text 0 0 10 -90 o
range 1300
text 0 0 10 -90 o
range 1400
text 0 0 10 -90 o
range 1500
text 0 0 10 -90 o
range 1600
text 0 0 10 -90 o
range 1700
text 0 0 10 -90 o
range 1800
text 0 0 10 -90 o
range 1900
text 0 0 10 -90 o
range 2000
text 0 0 10 -90 o
range 2100
text 0 0 10 -90 o
range 2200
text 0 0 10 -90 o
range 2300
text 0 0 10 -90 o
range 2400
text 0 0 10 -90 o
range 0
text -5 0 10 -90 0
range 400
text -5 0 10 -90 4
range 600
text -5 0 10 -90 6
range 800
text -5 0 10 -90 8
range 1000
text -5 0 10 -90 10
range 1200
text -5 0 10 -90 12
range 1400
text -5 0 10 -90 14
range 1600
text -5 0 10 -90 16
range 1800
text -5 0 10 -90 18
range 2000
text -5 0 10 -90 20
range 2200
text -5 0 10 -90 22
range 2400
text -5 0 10 -90 24

textscalex 1
textscaley 1

anglerangeoff
endpitchladder

setrangeanglemin 0
setrangeanglemax 0

# fov should be last as it draws the main border circle cutout
fov 10