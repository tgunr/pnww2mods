# gunsight file for H39, Model L.767, created by hchris, April 2012
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 4


text 45.4508 -35 2 0.0 E.38
text 32.54 -35 2 0.0 P.38
text -39.04 -61 2 0.0 M
thinline 39.6308 -37.5 39.6308 -32.5

pitchladder
ammotype sa38l33 3000

pos 0
range 0

setrangeanglemin 0.0
setrangeanglemax 4.0

thickline 0 4.3625 0 150 0.5
thickline 0 -150 0 -4.3625 0.5
thinline 0 -4.3625 0 4.3625
thinline -32.72 0 26.175 0

thinline 37.1308 0 42.1308 0

pos 0
range 0
trianglefill 39.6308 0.75 39.6308 -0.75 40.9508 0
trianglefill 39.6308 -0.75 39.6308 0.75 38.1308 0 

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
line 1 7.2708
text 0.85 0 1 0 o
range 200
line 0 7.2708
text -2 0 2 0 2
range 300
line 3.6354 7.2708
text 1.6354 0 2 0 3
range 400
line 0 7.2708
text -2 0 2 0 4
range 500
line 3.6354 7.2708
text 1.6354 0 2 0 5
range 600
line 0 7.2708
text -2 0 2 0 6
range 700
line 3.6354 7.2708
text 1.6354 0 2 0 7
range 800
line 0 7.2708
text -2 0 2 0 8
range 900
line 3.6354 7.2708
text 1.6354 0 2 0 9
range 1000
line 0 7.2708
text -2 0 2 0 10
range 1100
line 3.6354 7.2708
text 1.6354 0 2 0 11
range 1200
line 0 7.2708
text -2 0 2 0 12
range 1300
line 3.6354 7.2708
text 1.6354 0 2 0 13
range 1400
line 0 7.2708
text -2 0 2 0 14
endpitchladder

pitchladder
ammotype sa38l33he 3000
pos 41.4508
range 0
line 0 6.2
text 6.5 0 1 0 o
range 200
line 0 7.2708
text 9.2708 0 2 0 2
range 300
line 0 3.6354
text 5.6354 0 2 0 3
range 400
line 0 7.2708
text 9.2708 0 2 0 4
range 500
line 0 3.6354
text 5.6354 0 2 0 5
range 600
line 0 7.2708
text 9.2708 0 2 0 6
range 700
line 0 3.6354
text 5.6354 0 2 0 7
range 800
line 0 7.2708
text 9.2708 0 2 0 8
range 900
line 0 3.6354
text 5.6354 0 2 0 9
range 1000
line 0 7.2708
text 9.2708 0 2 0 10
range 1100
line 0 3.6354
text 5.6354 0 2 0 11
range 1200
line 0 7.2708
text 9.2708 0 2 0 12
range 1300
line 0 3.6354
text 5.6354 0 2 0 13
range 1400
line 0 7.2708
text 9.2708 0 2 0 14
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
fov 11.25