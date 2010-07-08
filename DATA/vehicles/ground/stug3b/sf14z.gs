# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 10

thickline -40 90 -40 -90 .1
thinline -30 90 -30 -90
text -21.5 -1 1.5 0 -20
thickline -20 90 -20 -90 .08
thinline -10 90 -10 -90
thickline 0 -1 0 -90 .1
thickline 0 1 0 90 .1
thinline 10 90 10 -90
thickline 20 90 20 -90 .08
text 21.5 -1 1.5 0 +20
thinline 30 90 30 -90
thickline 40 90 40 -90 .1
thickline -90 40 90 40 .1
thinline -90 30 90 30
text 1.5 21 1.5 0 +20
thickline -90 20 90 20 .08
thinline -90 10 90 10
thickline 1 0 90 0 .1
thickline -1 0 -90 0 .1
thinline -90 -10 90 -10
thickline -90 -20 90 -20 .08
text 1.5 -21 1.5 0 -20
thinline -90 -30 90 -30
thickline -90 -40 90 -40 .1

# fov should be last as it draws the main border circle cutout
fov 4.98