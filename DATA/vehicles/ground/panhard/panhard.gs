# gunsight file for Panhard, Model L.700, created by hchris, Feb 2012
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 4


text 32.04 5 2 0.0 C
text -32.04 5 2 0.0 M

pitchladder
ammotype sa34l72 3500

pos 0
range 0

setrangeanglemin 0
setrangeanglemax 3.5

thickline 0 4.3625 0 150 0.5
thickline 0 -150 0 -4.3625 0.5
thinline 0 -4.3625 0 4.3625
thinline -32.72 0 32.72 0

pos 4.3625
thinline 0 0 0 2.18

pos 8.725
thinline 0 0 0 4.3625

pos 13.0875
thinline 0 0 0 2.18

pos 17.45
thinline 0 0 0 4.3625

pos 21.8125
thinline 0 0 0 2.18

pos 26.175
thinline 0 0 0 4.3625

pos -4.3625
thinline 0 0 0 2.18

pos -8.725
thinline 0 0 0 4.3625

pos -13.0875
thinline 0 0 0 2.18

pos -17.45
thinline 0 0 0 4.3625

pos -21.8125
thinline 0 0 0 2.18

pos -26.175
thinline 0 0 0 4.3625

pos 0
range 0
trianglefill -30.54 -0.75 -30.54 0.75 -32.04 0
trianglefill 30.54 0.75 30.54 -0.75 32.04 0

setrangeanglemax 0.0

pos 32.04
range 0
line 0 4
text 4.5 0 1 0 o
range 400
line 0 5
text 7 0 2 0 4
range 600
line 0 3
text 5 0 2 0 6
range 800
line 0 5
text 7 0 2 0 8
range 1000
line 0 3
text 5 0 2 0 10
range 1200
line 0 5
text 7 0 2 0 12
range 1400
line 0 3
text 5 0 2 0 14
range 1600
line 0 5
text 7 0 2 0 16
range 1800
line 0 3
text 5 0 2 0 18
range 2000
line 0 5
text 7 0 2 0 20
range 2200
line 0 3
text 5 0 2 0 22
range 2400
line 0 5
text 7 0 2 0 24
range 2600
line 0 3
text 5 0 2 0 26
range 2800
line 0 5
text 7 0 2 0 28
range 3000
line 0 3
text 5 0 2 0 30
range 3100
line 0 5
text 7 0 2 0 31
range 3200
line 0 3
text 5 0 2 0 32
endpitchladder

pitchladder
ammotype 7_5mmtracerf 2000
pos -32.04
range 0
line 0 -3
text -3.2 0 1 0 o
range 200
line 0 -4
text -7 0 2 0 2
range 400
line 0 -3
text -5 0 2 0 4
range 600
line 0 -5
text -7 0 2 0 6
range 800
line 0 -8
text -10 0 2 0 8
range 1000
line 0 -5
text -7 0 2 0 10
range 1100
line 0 -8
text -10 0 2 0 11
range 1200
line 0 -5
text -7 0 2 0 12
range 1300
line 0 -8
text -10 0 2 0 13
range 1400
line 0 -5
text -7 0 2 0 14
range 1500
line 0 -8
text -10 0 2 0 15
range 1600
line 0 -5
text -7 0 2 0 16
endpitchladder


# fov should be last as it draws the main border circle cutout
fov 11.25