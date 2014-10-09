# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 3.5

pitchladder
ammotype 75mmsa32l17 2000

pos 0
range 0

line -7 2
rangeline 0 25 0 75
text -9 0 4 0 0
range 100
rangeline 0 125 0 175
line -3 -1
range 200
rangeline 0 225 0 275
line -7 -1
text -11 0 4 0 200
range 300
rangeline 0 325 0 375
line -3 -1
range 400
rangeline 0 425 0 475
line -7 -1
text -11 0 4 0 400
range 500
rangeline 0 525 0 575
line -3 -1
range 600
rangeline 0 625 0 675
line -7 -1
text -11 0 4 0 600
range 700
rangeline 0 725 0 775
line -3 -1
range 800
line -7 -1
rangeline 0 825 0 875
text -11 0 4 0 800
range 900
rangeline 0 925 0 975
line -3 -1
range 1000
rangeline 0 1025 0 1075
line -7 -1
text -12 0 4 0 1000
range 1100
rangeline 0 1125 0 1175
line -3 -1
range 1200
rangeline 0 1225 0 1275
line -7 -1
text -12 0 4 0 1200
range 1300
rangeline 0 1325 0 1375
line -3 -1
range 1400
rangeline 0 1425 0 1475
line -7 -1
text -12 0 4 0 1400
range 1500
rangeline 0 1525 0 1575
line -3 -1
range 1600
line -7 -1
text -12 0 4 0 1600

endpitchladder


# fov should be last as it draws the main border circle cutout
fov 11.25