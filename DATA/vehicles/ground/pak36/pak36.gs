# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 11.0

#setrangeanglemin 0
#setrangeanglemax 0.75

pitchladder
ammotype 37kwk46_pzgr 1500
pos 0
range 0
thinline -1 0 1 0
thinline -2.5 -2.5 2.5 -2.5
text 4 -2.5 1 0 400m
thinline -2.5 -5 2.5 -5
thinline -5 -7.5 5 -7.5
text 6.5 -7.5 1 0 800m
thinline 0 -9 0 2
thinline 0 -12 1.25 -13.5
thinline 0 -12 -1.25 -13.5
text 4 -12 1 0 1200m
#thinline 2.25 -3.5 -2.25 -3.5
#triangle 0 0 2.25 -3.5 -2.25 -3.5
#triangle -4 0 -5.25 -2 -2.75 -2
#triangle -8 0 -9.25 -2 -6.75 -2
#triangle -12 0 -13.25 -2 -10.75 -2
#triangle 4 0 2.75 -2 5.25 -2
#triangle 8 0 6.75 -2 9.25 -2
#triangle 12 0 10.75 -2 13.25 -2

#setrangereadout

#usetilt

# fov should be last as it draws the main border circle cutout
fov 1.8