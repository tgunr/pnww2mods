# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 2.5

setrangeanglemin 0
setrangeanglemax 4

pitchladder
ammotype 7_9mmtracer 1800
pos 0
range 0
#thinline 0 0 2.25 -3.5
#thinline 0 0 -2.25 -3.5
#thinline 2.25 -3.5 -2.25 -3.5
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

thinline 54 0 59 0
thinline -54 0 -59 0
thinline 80 0 85 0
thinline -80 0 -85 0

setrangeanglemin 0
setrangeanglemax 0

pos 60
range 0
line 15 19
text 13 0 6 0 0
range 300
line 0 4
text 6 0 5 0 3
range 500
line 0 6
text 8 0 5 0 5
range 700
line 0 4
text 6 0 5 0 7
range 900
line 0 6
text 8 0 5 0 9
range 1100
line 0 6
text 9 0 5 0 11
range 1300
line 0 6
text 9 0 5 0 13
range 1500
line 0 6
text 9 0 5 0 15

pos -60
range 0
line -15 -19
text -13 0 6 0 0
range 200
line 0 -4
text -6 0 5 0 2
range 400
line 0 -6
text -8 0 5 0 4
range 600
line 0 -4
text -6 0 5 0 6
range 800
line 0 -6
text -8 0 5 0 8
range 1000
line 0 -6
text -9 0 5 0 10
range 1200
line 0 -6
text -9 0 5 0 12
range 1400
line 0 -6
text -9 0 5 0 14

endpitchladder




# fov should be last as it draws the main border circle cutout
fov 25