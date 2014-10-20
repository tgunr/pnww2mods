# gunsight file for 17pdr ATG, Model No.51, created by hchris, Feb 2012
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 3

setrangereadout

thickline -26.175 0 -250 0 0.833
thickline 26.175 0 250 0 0.833
thickline 0 -17.45 0 -250 0.833
thickline 0 17.45 0 250 0.833

thinline -26.175 0 26.175 0
thinline 0 17.45 0 -17.45

thinline 17.45 4.36 17.45 -4.36
thinline -17.45 4.36 -17.45 -4.36
thinline 8.725 4.36 8.725 -4.36
thinline -8.725 4.36 -8.725 -4.36

text 21.81 -17.45 8.725 0 L
text -21.81 -17.45 8.725 0 R

ammotype 17pdrl55ap 3200

setrangeanglemin 0
setrangeanglemax 2.1

usetilt

# fov should be last as it draws the main border circle cutout
fov 13