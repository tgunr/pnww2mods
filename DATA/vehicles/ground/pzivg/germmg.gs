# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 1.8

ammotype 7_9mmtracer 1200

thinline 0 -3.5 0 -300
thinline 2.25 0 300 0
thinline -2.25 0 -300 0
triangle 0 0 2.25 -3.5 -2.25 -3.5

# fov should be last as it draws the main border circle cutout
fov 18