# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 4


text 35 5 3.0 0.0 37mm
text -35 5 3.0 0.0 7.5mm

pitchladder
ammotype sa38l21apc 2000

pos 0
range 0

setrangeanglemin 0.0
setrangeanglemax 4.0

thinline -200 200 0 0
thinline 200 200 0 0

trianglefill -20 -1 -20 1 -28 0
trianglefill 20 1 20 -1 28 0

setrangeanglemax 0.0

pos 30
range 0
line 0 4
text 6 0 2.5 0 0
range 100
line 0 2
range 200
line 0 8
text 10 0 2.5 0 2
range 300
line 0 2
range 400
line 0 5
text 7 0 2.5 0 4
range 500
line 0 2
range 600
line 0 8
text 10 0 2.5 0 6
range 700
line 0 2
range 800
line 0 5
text 7 0 2.5 0 8
range 900
line 0 2
range 1000
line 0 8
text 10.5 0 2.5 0 10
range 1100
line 0 2
range 1200
line 0 5
text 7.5 0 2.5 0 12
range 1300
line 0 2
range 1400
line 0 8
text 10.5 0 2.5 0 14
range 1500
line 0 2
range 1600
line 0 5
text 7.5 0 2.5 0 16
range 1700
line 0 2
range 1800
line 0 8
text 10.5 0 2.5 0 18
range 1900
line 0 2
range 2000
line 0 5
text 7.5 0 2.5 0 20

endpitchladder

pitchladder
ammotype 7_5mmtracerf 1500
pos -30
range 0
line 0 -3
text -5 0 2.5 0 0
range 400
line 0 -5
text -7 0 2.5 0 4
range 600
line 0 -8
text -10 0 2.5 0 6
range 800
line 0 -5
text -7 0 2.5 0 8
range 900
line 0 -8
text -10 0 2.5 0 9
range 1000
line 0 -5
text -7 0 2.5 0 10
range 1100
line 0 -8
text -10 0 2.5 0 11
range 1200
line 0 -5
text -7 0 2.5 0 12
range 1300
line 0 -8
text -10 0 2.5 0 13
range 1400
line 0 -5
text -7 0 2.5 0 14
endpitchladder

# fov should be last as it draws the main border circle cutout
fov 12.5