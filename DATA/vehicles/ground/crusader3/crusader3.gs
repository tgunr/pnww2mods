# gunsight file for A15 Crusader III, Model No.39 MK.IV, created by hchris, Feb 2012
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 3


text -73 7 2.5 0 A.P.C.B.C
text -72.5 4 2.5 0 2775 f.s.
text -61.5 10 2.5 0 A.P.C
text -61 7 2.5 0 & H.E.
text -59 4 2.5 0 2950 f.s.
text 68 4 2.5 0 M.G.

pitchladder
ammotype 6pdrl52ap 3000

pos 0
range 0

setrangeanglemin 0.0
setrangeanglemax 4.0

thickline -52.35 0 -26.175 0 1.454
thickline 52.35 0 26.175 0 1.454
thinline -200 0 -52.35 0
thinline 200 0 52.35 0

thickline 0 -26.175 0 -200 1.454
thickline 0 26.175 0 200 1.454



thinline -5.089 0 -1.454 0
thinline 5.089 0 1.454 0
thinline 0 -5.089 0 -1.454
thinline 0 5.089 0 1.454

thinline -8.725 0.727 -8.725 2.181
thinline -8.725 -0.727 -8.725 -2.181

thinline -13.814 0 -12.36 0

thinline -17.45 0.727 -17.45 2.181
thinline -17.45 -0.727 -17.45 -2.181

thinline -22.539 0 -21.085 0 


thinline 8.725 0.727 8.725 2.181
thinline 8.725 -0.727 8.725 -2.181

thinline 13.814 0 12.36 0

thinline 17.45 0.727 17.45 2.181
thinline 17.45 -0.727 17.45 -2.181

thinline 22.539 0 21.085 0 



pos 0
range 0

setrangeanglemax 0.0

pos -66.8915
range 0
line 0 -2.91
text -3.91 0 2.5 0 0
range 365.76
line 0 -5.82
text -6.82 0 2.5 0 4
range 731.52
line 0 -2.91
text -3.91 0 2.5 0 8
range 1097.28
line 0 -5.82
text -7.82 0 2.5 0 12
range 1463.04
line 0 -2.91
text -4.91 0 2.5 0 16
range 1828.8
line 0 -5.82
text -7.82 0 2.5 0 20
range 2194.56
line 0 -2.91
text -4.91 0 2.5 0 24
range 2560.32
line 0 -5.82
text -7.82 0 2.5 0 28
endpitchladder

pitchladder
ammotype 6pdrl52he 3000
pos -65.4375
range 0
line 0 2.91
text 3.91 0 2.5 0 0
range 365.76
line 0 5.82
text 6.82 0 2.5 0 4
range 731.52
line 0 2.91
text 3.91 0 2.5 0 8
range 1097.28
line 0 5.82
text 7.82 0 2.5 0 12
range 1463.04
line 0 2.91
text 4.91 0 2.5 0 16
range 1828.8
line 0 5.82
text 7.82 0 2.5 0 20
range 2194.56
line 0 2.91
text 4.91 0 2.5 0 24
range 2560.32
line 0 5.82
text 7.82 0 2.5 0 28
endpitchladder

pitchladder
ammotype 7_9mm_mg37t 3200
pos 65.4375
range 0
line 0 2.91
text 3.91 0 2.5 0 0
range 365.76
line 0 5.82
text 6.82 0 2.5 0 4
range 731.52
line 0 2.91
text 3.91 0 2.5 0 8
range 1097.28
line 0 5.82 
text 7.82 0 2.5 0 12
range 1463.04
line 0 2.91
text 4.91 0 2.5 0 16
endpitchladder


# fov should be last as it draws the main border circle cutout
fov 13