# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 2.8

setrangereadout

thickline -26 0 -250 0 1
thickline 26 0 250 0 1
thickline 0 -9 0 -250 1
thickline 0 9 0 250 1
thinline -27 0 27 0
thinline 0 10 0 -10
thinline 17.5 4.4 17.5 -4.4
thinline -17.5 4.4 -17.5 -4.4
thinline 8.75 4.4 8.75 -4.4
thinline -8.75 4.4 -8.75 -4.4

text 17.5 -15 12 0 L
text -17.5 -15 12 0 R

ammotype 6pdrl52ap 1400

setrangeanglemin 0
setrangeanglemax 0.575

usetilt

# fov should be last as it draws the main border circle cutout
fov 13