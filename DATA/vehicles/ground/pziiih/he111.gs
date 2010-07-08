# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 2.0
#mag 1

#setrangeanglemax 0.0

setrangeanglemin 5.9
setrangeanglemax -5.5

#triangle -12 0 -13.25 -2 -10.75 -2

#thickline 90 60 190 140 1
#thickline 48 20 98 80 1
#thickline 20 0 100 60 1
#thickline 0 -40 0 -500 1
#thickline 0 40 0 500 1
thinline 0 -0 0 -500
thinline 0 0 0 500

#thinline 200 -100 -280 500

#text 30 120 8 -51 1k
#text 50 100 8 -51 1k
#thinline 47 97 44 94
#thinline 0 0 -2.25 -3.5
#thinline 0 0 2.25 -3.5
thinline -50 -0 50 -0
#thinline 0 -0 500 -0
#trianglefill 88 59 240 160 200 160
thinline 80 -100 80 100
thinline 80 100 90 100
thinline 80 90 85 90
thinline 80 80 90 80
thinline 80 70 85 70
thinline 80 60 90 60
thinline 80 50 85 50
thinline 80 40 90 40
thinline 80 30 85 30
thinline 80 20 90 20
thinline 80 10 85 10
thinline 80 0 90 0
thinline 80 -10 85 -10
thinline 80 -20 90 -20
thinline 80 -30 85 -30
thinline 80 -40 90 -40
thinline 80 -50 85 -50
thinline 80 -60 90 -60
thinline 80 -70 85 -70
thinline 80 -80 90 -80
thinline 80 -90 85 -90
thinline 80 -100 90 -100
pitchladder
ammotype gp500 5000
pos 0
range 0
#pitchscale 50
#setrangeanglemax -2.5
#trianglefill 88 59 100 80 160 100
trianglefill 88 -100 330 -110 330 -90


# fov should be last as it draws the main border circle cutout
fov 35