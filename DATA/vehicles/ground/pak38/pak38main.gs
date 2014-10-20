# gunsight file for Pak 38, Model ZF 3x8°, created by hchris, Feb 2012
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
thinline 0 -80 0 -37
thinline 0 80 0 37

thinline -10 0 -14 -4
thinline -10 0 -6 -4
thinline 10 0 14 -4
thinline 10 0 6 -4

ammotype 5cm38l60_pzgr_patr38 2500

setrangeanglemin -8.63
setrangeanglemax -5.97

usetilt

# fov should be last as it draws the main border circle cutout
fov 8