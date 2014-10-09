# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 5

setrangereadout

thinline -86 -80 0 0
thinline 86 -80 0 0
thinline 0 -80 0 -18.5
thinline 0 80 0 37

# thinline -3.9 0 -3.9 -1.85
# triangle -7.8 0 -10.3 -3.7 -5.3 -3.7
# thinline -11.6 0 -11.6 -1.85
# triangle -15.4 0 -17.9 -3.7 -12.9 -3.7
# thinline -19.2 0 -19.2 -1.85
# triangle -23 0 -25.5 -3.7 -20.5 -3.7
# thinline 3.9 0 3.9 -1.85
# triangle 7.8 0 5.3 -3.7 10.3 -3.7
# thinline 11.6 0 11.6 -1.85
# triangle 15.4 0 12.9 -3.7 17.9 -3.7
# thinline 19.2 0 19.2 -1.85
# triangle 23 0 20.5 -3.7 25.5 -3.7

ammotype 75mmsprgr34 3600

setrangeanglemin -8.63
setrangeanglemax 0

usetilt

# fov should be last as it draws the main border circle cutout
fov 8