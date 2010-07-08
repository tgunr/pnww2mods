# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 4
#mag 1

setrangeanglemax 0.0

ammotype sa34l72 3500

##Targeting "V"
thinline -200 200 0 0
thinline 200 200 0 0

##Range markers
thinline 10 1 10 -5
thinline 25 1 25 -5
thinline 40 1 40 -5
thinline -10 1 -10 -5
thinline -25 1 -25 -5
thinline -40 1 -40 -5

##Range tickers

##Range 0
thinline 50 0 60 0
text 61 0 3 0 0

##Range 200
thinline 50 -1.1 55 -1.1

##Range 400
thinline 50 -2.2 65 -2.2
text 68 -2.2 3 0 400

##Range 700
thinline 50 -4.2 60 -4.2
text 63 -4.2 3 0 700

##Range 1st inbetween
thinline 50 -4.9 55 -4.9

##Range 2nd inbetween
thinline 50 -5.6 55 -5.6

##Range 1000
thinline 50 -6.5 65 -6.5
text 68 -6.5 3 0 1000

##Range 1100
thinline 50 -7.2 55 -7.2

##Range 1200
thinline 50 -8.1 60 -8.1
text 63 -8.1 3 0 1200

##Range 1300
thinline 50 -8.9 55 -8.9

##Range 1400
thinline 50 -9.9 65 -9.9
text 68 -9.9 3 0 1400

##Range 1500
thinline 50 -10.8 55 -10.8

##Range 1600
thinline 50 -11.8 60 -11.8
text 63 -11.8 3 0 1600

##Range 1700
thinline 50 -13 55 -13

##Range 1800
thinline 50 -14 65 -14
text 68 -14 3 0 1800

##Range 1900
thinline 50 -15.3 55 -15.3

##Range 2000
thinline 50 -16.5 60 -16.5
text 63 -16.5 3 0 2000

##Range 2100
thinline 50 -17.8 55 -17.8

##Range 2200
thinline 50 -19.1 65 -19.1
text 68 -19.1 3 0 2200

##Range 2300
thinline 50 -20.5 55 -20.5

##Range 2400
thinline 50 -22 60 -22
text 63 -22 3 0 2400

##Range 2500
thinline 50 -23.5 55 -23.5

##Range 2600
thinline 50 -25 65 -25
text 68 -25 3 0 2600

##Range 2700
thinline 50 -26.8 55 -26.8

##Range 2800
thinline 50 -28.6 60 -28.6
text 63 -28.6 3 0 2800

##Range 2900
thinline 50 -30.5 55 -30.5

##Range 3000
thinline 50 -32.4 65 -32.4
text 68 -32.4 3 0 3000

##Range 3100
thinline 50 -34.8 55 -34.8

##Range 3200
thinline 50 -37 60 -37
text 63 -37 3 0 3200

##Range 3300
thinline 50 -39.3 55 -39.3

##Range 3400
thinline 50 -41.5 65 -41.5
text 68 -41.5 3 0 3400

##Range 3500
thinline 50 -44.2 55 -44.2
#text 63 -44.2 3 0 3500

setrangeanglemin 0
setrangeanglemax 2.53

setrangereadout

usetilt
##Range mark
trianglefill 50 0 45 1 45 -1



# fov should be last as it draws the main border circle cutout
fov 10.125