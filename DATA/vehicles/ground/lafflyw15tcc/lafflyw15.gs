# gunsight file same as mle47 AT gun
# created 12-05-03 for Laffly W-15TCC by Doc.

# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 4

pitchladder
ammotype sa39l53 4000

pos 0
range 0

setrangeanglemin 0.0
setrangeanglemax 3.0

#thinline -200 200 0 0
#thinline 200 200 0 0

trianglefill 20 1 20 -1 28 0

thickline 0 17.45 0 300 0.5
thickline 0 -17.45 0 -300 0.5
#thinline 0 17.45 0 -17.45

thinline 0 4.4 0 -4.4

thinline -17.45 0 17.45 0
thinline 13.1 2.2 13.1 -2.2
thinline -13.1 2.2 -13.1 -2.2
thinline 8.7 2.2 8.7 -2.2
thinline -8.7 2.2 -8.7 -2.2
thinline 4.4 2.2 4.4 -2.2
thinline -4.4 2.2 -4.4 -2.2

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

range 2100
line 0 2

range 2200
text 10.5 0 2.5 0 22
line 0 8

range 2300
line 0 2

range 2400
line 0 5
text 7.5 0 2.5 0 24

range 2500
line 0 2

range 2600
text 10.5 0 2.5 0 26
line 0 8

range 2700
line 0 2

range 2800
line 0 5
text 7.5 0 2.5 0 28

range 2900
line 0 2

range 3000
text 10.5 0 2.5 0 30
line 0 8

range 3100
line 0 2


range 3200
line 0 5
text 7.5 0 2.5 0 32

range 3300
line 0 2

range 3400
text 10.5 0 2.5 0 34
line 0 8

range 3500
line 0 2
endpitchladder


# fov should be last as it draws the main border circle cutout
fov 10.0