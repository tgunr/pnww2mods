# gunsight file for M4a3(76) Sherman
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 3

pos 0
range 0

text -0.3 85 9 0 75-M70

pitchladder
ammotype 76mml52m79ap 3400

setrangeanglemin 0.0
setrangeanglemax 0.0

pos 0
range 0
thinline -2.2 0 2.2 0
thinline 0 -2 0 2

range 366
thinline -49.8 0 -41.5 0
thinline -33.2 0 -24.9 0
thinline -16.6 0 -8.3 0
thinline -4.1 0 4.1 0
thinline 16.6 0 8.3 0
thinline 33.2 0 24.9 0
thinline 49.8 0 41.5 0
#text -21 0 4 0 4
#text 21 0 4 0 4

thinline 0 0 0 -2.4

range 732
thinline -33.2 0 -24.9 0
thinline -16.6 0 -8.3 0
thinline 16.6 0 8.3 0
thinline 33.2 0 24.9 0
text -43 0 7 0 8
text 43 0 7 0 8

thinline 0 0 0 -2.6

range 1097
thinline -33.2 0 -24.9 0
thinline -16.6 0 -8.3 0
thinline -4.1 0 4.1 0
thinline 16.6 0 8.3 0
thinline 33.2 0 24.9 0
#text -21 0 4 0 10
#text 21 0 4 0 10

thinline 0 0 0 -2.8

range 1463
thinline -33.2 0 -24.9 0
thinline -16.6 0 -8.3 0
thinline 16.6 0 8.3 0
thinline 33.2 0 24.9 0
text -44 0 7 0 16
text 44 0 7 0 16

thinline 0 0 0 -3

range 1829
thinline -33.2 0 -24.9 0
thinline -16.6 0 -8.3 0
thinline -4.1 0 4.1 0
thinline 16.6 0 8.3 0
thinline 33.2 0 24.9 0
#text -21 0 4 0 20
#text 21 0 4 0 20

thinline 0 0 0 -3.2

range 2195
thinline -16.6 0 -8.3 0
thinline 16.6 0 8.3 0
text -28 0 7 0 24
text 28 0 7 0 24

thinline 0 0 0 -3.5

range 2560
thinline -33.2 0 -24.9 0
thinline -16.6 0 -8.3 0
thinline 16.6 0 8.3 0
thinline 33.2 0 24.9 0

thinline 0 0 0 -3.8

range 2926
thinline -16.6 0 -8.3 0
thinline 16.6 0 8.3 0
text -28 0 7 0 32
text 28 0 7 0 32

thinline 0 0 0 -4.1

setrangeanglemax 0

#setrangereadout

#usetilt

# fov should be last as it draws the main border circle cutout
fov 13