# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 4

thinline 0 -60 0 -40
thinline -20 -60 -20 -50
thinline -40 -60 -40 -40
thinline -60 -60 -60 -50
thinline -80 -60 -80 -40
thinline -100 -60 -100 -50
thinline -120 -60 -120 -40
thinline -140 -60 -140 -50
thinline -160 -60 -160 -40
thinline 20 -60 20 -50
thinline 40 -60 40 -40
thinline 60 -60 60 -50
thinline 80 -60 80 -40
thinline 100 -60 100 -50
thinline 120 -60 120 -40
thinline 140 -60 140 -50
thinline 160 -60 160 -40

text 0 -63 6 0 0
text -40 -63 6 0 10
text -80 -63 6 0 20
text -120 -63 6 0 30
text -160 -63 6 0 40
text 40 -63 6 0 10
text 80 -63 6 0 20
text 120 -63 6 0 30
text 160 -63 6 0 40

# fov should be last as it draws the main border circle cutout
fov 45