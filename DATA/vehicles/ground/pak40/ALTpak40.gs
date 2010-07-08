# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 2.4

setrangereadout

thickline -40 0 -500 0 1
thickline 40 - 500 0 1
thickline 0 -40 0 -500 1
thickline 0 40 0 500 1
thinline -40 0 -10 0
thinline 40 0 10 0
thinline 0 -40 0 -10
thinline 0 40 0 10
thinline 0 0 -2.25 -3.5
thinline 0 0 2.25 -3.5

ammotype 75mmpak40l46 2400

setrangeanglemin 0
setrangeanglemax 0.71

usetilt

# fov should be last as it draws the main border circle cutout
fov 24