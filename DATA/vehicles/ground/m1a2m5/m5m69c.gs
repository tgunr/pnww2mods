# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 2.8

pitchladder
ammotype 6pdrl52ap 3200
pos 0
range 0

text -0.3 85 11 0 57-M86

thinline -5 0 5 0
thinline 0 2 0 -1.25

thinline -60.2 -2.5 -49 -2.5
thinline -42 -2.5 -30.8 -2.5
thinline -22.4 -2.5 -11.2 -2.5
thinline 22.4 -2.5 11.2 -2.5
thinline 42 -2.5 30.8 -2.5
thinline 60.2 -2.5 49 -2.5

thinline 0 -2.5 0 -3.8

thinline -42 -5.1 -30.8 -5.1
thinline -22.4 -5.1 -11.2 -5.1
thinline 22.4 -5.1 11.2 -5.1
thinline 42 -5.1 30.8 -5.1

text -52 -5.2 7.5 0 8
text 52 -5.2 7.5 0 8

thinline 0 -5.1 0 -6.4

thinline -42 -7.7 -30.8 -7.7
thinline -22.4 -7.7 -11.2 -7.7
thinline 22.4 -7.7 11.2 -7.7
thinline 42 -7.7 30.8 -7.7

thinline 0 -7.7 0 -9.2

thinline -42 -10.6 -30.8 -10.6
thinline -22.4 -10.6 -11.2 -10.6
thinline 22.4 -10.6 11.2 -10.6
thinline 42 -10.6 30.8 -10.6

text -53 -10.6 7.5 0 16
text 53 -10.6 7.5 0 16

thinline 0 -10.6 0 -12.2

thinline -42 -13.8 -30.8 -13.8
thinline -22.4 -13.8 -11.2 -13.8
thinline 22.4 -13.8 11.2 -13.8
thinline 42 -13.8 30.8 -13.8

thinline 0 -13.8 0 -15.5

thinline -22.4 -17.2 -11.2 -17.2
thinline 22.4 -17.2 11.2 -17.2

text -35 -17.2 7.5 0 24
text 35 -17.2 7.5 0 24

thinline 0 -17.2 0 -19.3

thinline -42 -21.3 -30.8 -21.3
thinline -22.4 -21.3 -11.2 -21.3
thinline 22.4 -21.3 11.2 -21.3
thinline 42 -21.3 30.8 -21.3

thinline 0 -21.3 0 -23.4

thinline -22.4 -25.5 -11.2 -25.5
thinline 22.4 -25.5 11.2 -25.5

text -35 -25.5 7.5 0 32
text 35 -25.5 7.5 0 32

thinline 0 -25.5 0 -27.7

#setrangeanglemin 0
#setrangeanglemax 0

#setrangereadout

#usetilt

# fov should be last as it draws the main border circle cutout
fov 13