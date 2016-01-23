# gunsight file for A13 Cruiser, Model No.33 MK.IVS, created by hchris, May 2012
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 1.9

text -8 150 2.5 0 2 PDR.
text 7 150 2.5 0 GUN 

text -8 147 2.5 0 37MM.
text 7 147 2.5 0 GUN 

text -93 4 2.5 0 A.P.C.B.C
text 88 4 2.5 0 M.G.

pitchladder
ammotype 40mml50ap 3000

pos 0
range 0

setrangeanglemin 0.0
setrangeanglemax 0.0

thinline 0 0.8725 0 -1.745
thinline -0.8725 0 0.8725 0

pos 0
range 731.52

thickline -79.8336 0 -35.64 0 1.454
thickline -104.7816 0 -200 0 1.454
thickline 79.8336 0 35.64 0 1.454
thickline 93.0549 0 200 0 1.454

thickline 0 -35.64 0 -200 1.454
thickline 0 35.64 0 200 1.454


thinline 2.97 0 5.94 0
thinline 11.88 0 14.85 0
thinline 20.79 0 23.76 0
thinline 29.7 0 32.67 0

thinline -2.97 0 -5.94 0
thinline -11.88 0 -14.85 0
thinline -20.79 0 -23.76 0
thinline -29.7 0 -32.67 0


rangeline 0 731.52 0 1097.28
range 1097.28
thinline -0.8725 0 0.8725 0

range 731.52
thinline 26.73 0 26.73 -1.745
rangeline 17.82 731.52 17.82 1097.28
rangeline 8.91 731.52 8.91 1463.04

range 731.52
thinline -26.73 0 -26.73 -1.745
rangeline -17.82 731.52 -17.82 1097.28
rangeline -8.91 731.52 -8.91 1463.04

range 1463.04
thinline 0 0.8725 0 -0.8725
thinline -1.745 0 1.745 0


thinline 0 0.8725 0 -1.745
thinline -0.8725 0 0.8725 0


pos 0
range 0

pos -84
range 0
thinline 0 0.8725 0 -1.745
thinline -0.8725 0 0.8725 0
text -3.91 0 2.5 0 0

range 365.76
text -6.82 0 2.5 0 4

range 731.52
text -3.91 0 2.5 0 8
text -17 0 2.5 0 SV

rangeline 0 731.52 0 1097.28

range 1097.28
thinline -0.8725 0 0.8725 0
text -7.82 0 2.5 0 12

range 1463.04
thinline 0 0.8725 0 -0.8725
thinline -1.745 0 1.745 0
text -4.91 0 2.5 0 16

range 1828.8
text -7.82 0 2.5 0 20

endpitchladder


pitchladder
ammotype 7_9mm_mg37t 3200
pos 84

range 457.2
text 3.91 0 2.5 0 5

rangeline 0 457.2 0 731.52 

range 731.52
thinline -0.8725 0 0.8725 0
text 6.82 0 2.5 0 8

range 914.4
thinline 0 0.8725 0 -0.8725
thinline -1.745 0 1.745 0
text 4.91 0 2.5 0 10

range 1097.28
thinline -0.8725 0 0.8725 0 
text 7.82 0 2.5 0 12

range 1463.04
thinline -1,745 0 1.745 0
text 4.91 0 2.5 0 16

pos 0
range 1463.04
thinline -1,745 0 1.745 0


endpitchladder


# fov should be last as it draws the main border circle cutout
fov 21