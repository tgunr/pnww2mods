# gunsight file for R35, Model L.739, created by hchris, May 2012
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 4


text 63 -6 2 0.0 OR 35
text 63 -17 2 0.0 OA 16
text -63 -6 2 0.0 M

pitchladder
ammotype sa38l21apc 2000

pos 0
range 0

setrangeanglemin 0.0
setrangeanglemax 4.0

thinline 0 0 150 150
thinline 0 0 -150 150
thinline -32.72 0 -30.54 0
thinline 32.72 0 30.54 0

pos 0
range 0
trianglefill 30.54 0.75 30.54 -0.75 32.04 0 

pos 0
range 0
trianglefill -30.54 -0.75 -30.54 0.75 -32.04 0

pos 0
range 0

setrangeanglemax 0.0

pos 32.04
line 0 6.2
text 6.5 0 1 0 o
range 200
line 0 14.5416
text 16.5416 0 2 0 2
range 300
line 0 7.2708
range 400
line 0 14.5416
text 16.5416 0 2 0 4
range 500
line 0 7.2708
range 600
line 0 14.5416
text 16.5416 0 2 0 6

pos 0
range 600
thinline 53 0 73 0

endpitchladder


pitchladder
ammotype sa38l21 2000
pos 32.04
#range 300
#line 0 7.2708
#text 9.2708 0 2 0 3
#range 400
#line 0 14.5416
#text 16.5416 0 2 0 4
range 500
line 0 7.2708
text 9.2708 0 2 0 5
range 600
line 0 14.5416
text 16.5416 0 2 0 6
range 700
line 0 7.2708
text 9.2708 0 2 0 7
range 800
line 0 14.5416
text 16.5416 0 2 0 8
range 900
line 0 7.2708
text 9.2708 0 2 0 9
range 1000
line 0 14.5416
text 16.5416 0 2 0 10
endpitchladder

pitchladder
ammotype 7_5mmtracerf 2000
pos -32.04
range 0
line 0 -6.2
text -6.5 0 1 0 o
range 200
line 0 -14.5416
text -16.5416 0 2 0 2
range 400
line 0 -7.2708
text -9.2708 0 2 0 4
range 500
line 0 -3.6354
range 600
line 0 -14.5416
text -16.5416 0 2 0 6
range 700
line 0 -3.6354
range 800
line 0 -7.2708
text -9.2708 0 2 0 8
range 900
line 0 -3.6354
range 1000
line 0 -14.5416
text -16.5416 0 2 0 10
range 1100
line 0 -7.2708
text -9.2708 0 2 0 11
range 1200
line 0 -14.5416
text -16.5416 0 2 0 12
range 1300
line 0 -7.2708
text -9.2708 0 2 0 13
range 1400
line 0 -14.5416
text -16.5416 0 2 0 14
range 1500
line 0 -7.2708
text -9.2708 0 2 0 15
range 1600
line 0 -14.5416
text -16.5416 0 2 0 16
endpitchladder


# fov should be last as it draws the main border circle cutout
fov 10.13