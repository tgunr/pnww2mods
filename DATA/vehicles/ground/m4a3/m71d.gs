# gunsight file for M4A3(76) Sherman, Model M71D, created by hchris, Apr 2012
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 5

pos 0
range 0

text -0.3 85 2 0 76-M62

pitchladder
ammotype 76mml52m79ap 4200

setrangeanglemin 0.0
setrangeanglemax 0.0

pos 0
range 0
thinline -2.2 0 2.2 0
thinline 0 -1.5 0 1.5

range 366
thinline -30 0 -25 0

thinline -20 0 -15 0

thinline -10 0 -5 0

thinline 5 0 10 0

thinline 15 0 20 0

thinline 25 0 30 0

rangeline 0 366 0 549

range 732
thinline -20 0 -15 0

thinline -10 0 -5 0

thinline 5 0 10 0

thinline 15 0 20 0

text -25 0 2 0 8

text 25 0 2 0 8

rangeline 0 732 0 914

range 1097
thinline -20 0 -15 0

thinline -10 0 -5 0

thinline 5 0 10 0

thinline 15 0 20 0

rangeline 0 1097 0 1280

range 1463
thinline -20 0 -15 0

thinline -10 0 -5 0

thinline 5 0 10 0

thinline 15 0 20 0

text -25 0 2 0 16

text 25 0 2 0 16

rangeline 0 1463 0 1646

range 1829
thinline -20 0 -15 0

thinline -10 0 -5 0

thinline 5 0 10 0

thinline 15 0 20 0

rangeline 0 1829 0 2012

range 2195
thinline -10 0 -5 0

thinline 5 0 10 0

text -15 0 2 0 24

text 15 0 2 0 24

rangeline 0 2195 0 2377

range 2560
thinline -20 0 -15 0

thinline -10 0 -5 0

thinline 5 0 10 0

thinline 15 0 20 0

rangeline 0 2560 0 2743

range 2926
thinline -10 0 -5 0

thinline 5 0 10 0

text -15 0 2 0 32

text 15 0 2 0 32

rangeline 0 2926 0 3109

rangeline 0 3292 0 3475

rangeline 0 3658 0 3840

range 3840
text -5 0 2 0 42
text 5 0 2 0 42

setrangeanglemax 0.0

#setrangereadout

#usetilt

# fov should be last as it draws the main border circle cutout
fov 13