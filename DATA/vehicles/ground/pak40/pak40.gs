# gunsight file for Stug IIIG, Model Sfl.ZF1a, created by hchris, Feb 2012
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 3

setrangereadout

thinline -86 -86 0 0
thinline 86 -86 0 0
thinline 0 -80 0 -18.5
thinline 0 80 0 37

thinline -4 0 -4 -2

thinline -8 0 -10.31 -4
thinline -8 0 -5.69 -4
thinline -10.31 -4 -8.77 -4
thinline -5.69 -4 -7.23 -4

thinline -12 0 -12 -2

thinline -16 0 -18.31 -4
thinline -16 0 -13.69 -4
thinline -18.31 -4 -16.77 -4
thinline -13.69 -4 -15.23 -4

thinline -20 0 -20 -2

thinline -24 0 -26.31 -4
thinline -24 0 -21.69 -4
thinline -26.31 -4 -24.77 -4
thinline -21.69 -4 -23.23 -4


thinline 4 0 4 -2

thinline 8 0 10.31 -4
thinline 8 0 5.69 -4
thinline 10.31 -4 8.77 -4
thinline 5.69 -4 7.23 -4

thinline 12 0 12 -2

thinline 16 0 18.31 -4
thinline 16 0 13.69 -4
thinline 18.31 -4 16.77 -4
thinline 13.69 -4 15.23 -4

thinline 20 0 20 -2

thinline 24 0 26.31 -4
thinline 24 0 21.69 -4
thinline 26.31 -4 24.77 -4
thinline 21.69 -4 23.23 -4


ammotype 75mmpak40l46ap 5000

setrangeanglemin -2.62
setrangeanglemax 0.40

usetilt

# fov should be last as it draws the main border circle cutout
fov 8