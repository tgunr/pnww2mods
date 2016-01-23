# gunsight file for Stug IIIB, Model Sfl.ZF1, created by hchris, Feb 2012
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 5

setrangereadout

triangle -4 0 -5.155 -2 -2.845 -2
triangle -8 0 -9.155 -2 -6.845 -2
triangle -12 0 -13.155 -2 -10.845 -2

triangle 0 0 -2.31 -4 2.31 -4  

triangle 4 0 5.155 -2 2.845 -2
triangle 8 0 9.155 -2 6.845 -2
triangle 12 0 13.155 -2 10.845 -2

ammotype 75mmsprgr34 3600

setrangeanglemin -8.63
setrangeanglemax 0

usetilt

# fov should be last as it draws the main border circle cutout
fov 8