# gunsight file for S35, Model L.762, created by hchris, Feb 2012
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 4


text 43.18 -35 2 0.0 Ex.32
text 32.54 -35 2 0.0 BR.
text -39.04 -61 2 0.0 M
thinline 37.36 -37.5 37.36 -32.5

pitchladder
ammotype 47mmsa35l34 3000

pos 0
range 0

setrangeanglemin 0.0
setrangeanglemax 4.0

thickline 0 4.3625 0 150 0.5
thickline 0 -150 0 -4.3625 0.5
thinline 0 -4.3625 0 4.3625
thinline -32.72 0 26.175 0

thinline 34.86 0 39.86 0

pos 0
range 0
trianglefill 37.36 0.75 37.36 -0.75 38.68 0
trianglefill 37.36 -0.75 37.36 0.75 35.86 0 

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

setrangeanglemax 0.0

pos 30.54
range 0
line 1 5
text 0.85 0 1 0 o
range 200
line 0 5
text -2 0 2 0 2
range 400
line 2 5
text 0 0 2 0 4
range 600
line 0 5
text -2 0 2 0 6
range 800
line 2 5
text 0 0 2 0 8
range 900
line 0 5
text -2 0 2 0 9
range 1000
line 2 5
text 0 0 2 0 10
range 1100
line 0 5
text -2 0 2 0 11
range 1200
line 2 5
text 0 0 2 0 12
range 1300
line 0 5
text -2 0 2 0 13
range 1400
line 2 5
text 0 0 2 0 14
range 1500
line 0 5
text -2 0 2 0 15
endpitchladder

pitchladder
ammotype 47mmsa35l34he 3000
pos 39.18
range 0
line 0 4
text 4.5 0 1 0 o
range 100
line 0 5
text 7 0 2 0 1
range 200
line 0 3
text 5 0 2 0 2
range 400
line 0 5
text 7 0 2 0 4
range 600
line 0 3
text 5 0 2 0 6
range 700
line 0 5
text 7 0 2 0 7
range 800
line 0 3
text 5 0 2 0 8
range 900
line 0 5
text 7 0 2 0 9
range 1000
line 0 3
text 5 0 2 0 10
range 1100
line 0 5
text 7 0 2 0 11
range 1200
line 0 3
text 5 0 2 0 12
range 1300
line 0 5
text 7 0 2 0 13
range 1400
line 0 3
text 5 0 2 0 14
range 1500
line 0 5
text 7 0 2 0 15
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
fov 11.82