# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 3

text -9 95 5 0 17 PDR
text 7 95 5 0.0 GUN
#text -56.5 14 5 0 HE       APC
text -56.5 10 5 0 HE & APC
text -56.5 6 5 0 2960 2729
text 48 10 5 0 MG
thickline -34.9 -1 -43.6 -1 1
thickline 34.9 -1 43.6 -1 1

pitchladder
ammotype 17pdrl55ap 3200

pos 0
range 0

setrangeanglemin 0.0
setrangeanglemax 3.16

thinline 0 1.4 0 5.1
thickline 0 26.1 0 61 1
thinline  0 61 0 220
thinline 0 -1.4 0 -5.1
thickline 0 -26.1 0 -43.5 1
thinline  0 -43.5 0 -120
thinline -1.4 0 -5.1 0
thinline -8.7 0.7 -8.7 2.1
thinline -8.7 -0.7 -8.7 -2.1
thinline -12.3 0 -13.8 0
thinline -17.4 0.7 -17.4 2.1
thinline -17.4 -0.7 -17.4 -2.1
thinline -21.1 0 -22.5 0
thickline -26.1 0 -34.9 0 1
thinline -34.9 0 -120 0
thinline 1.4 0 5.1 0
thinline 8.7 0.7 8.7 2.1
thinline 8.7 -0.7 8.7 -2.1
thinline 12.3 0 13.8 0
thinline 17.4 0.7 17.4 2.1
thinline 17.4 -0.7 17.4 -2.1
thinline 21.1 0 22.5 0
thickline 26.1 0 34.9 0 1
thinline 34.9 0 120 0
thinline 1.7 68.5 1.7 71
thinline 3.4 68.5 3.4 71
thinline 5.1 68.5 5.1 71
thinline 6.8 68.5 6.8 71
thinline 8.5 67.2 8.5 72.2
thinline 10.2 68.5 10.2 71
thinline 11.9 68.5 11.9 71
thinline 13.6 68.5 13.6 71
thinline 15.3 68.5 15.3 71
thinline 17 67.2 17 72.2
thinline -1.7 68.5 -1.7 71
thinline -3.4 68.5 -3.4 71
thinline -5.1 68.5 -5.1 71
thinline -6.8 68.5 -6.8 71
thinline -8.5 67.2 -8.5 72.2
thinline -10.2 68.5 -10.2 71
thinline -11.9 68.5 -11.9 71
thinline -13.6 68.5 -13.6 71
thinline -15.3 68.5 -15.3 71
thinline -17 67.2 -17 72.2

setrangeanglemax 0.0

pos -45.1
range 0
line 0 -3.7
text -5.7 0 4 0 0
range 100
line 0 -1.8
range 200
line 0 -3.7
range 300
line 0 -1.8
range 400
line 0 -7.5
text -9.5 0 4 0 4
range 500
line 0 -1.8
range 600
line 0 -3.7
range 700
line 0 -1.8
range 800
line 0 -3.7
text -5.7 0 4 0 8
range 900
line 0 -1.8
range 1000
line 0 -3.7
range 1100
line 0 -1.8
range 1200
line 0 -7.5
text -9.5 0 4 0 12
range 1300
line 0 -1.8
range 1400
line 0 -3.7
range 1500
line 0 -1.8
range 1600
line 0 -3.7
text -5.7 0 4 0 16
range 1700
line 0 -1.8
range 1800
line 0 -3.7
range 1900
line 0 -1.8
range 2000
line 0 -7.5
text -9.5 0 4 0 20
range 2100
line 0 -1.8
range 2200
line 0 -3.7
range 2300
line 0 -1.8
range 2400
line 0 -3.7
text -5.7 0 4 0 24
range 2500
line 0 -1.8
range 2600
line 0 -3.7
range 2700
line 0 -1.8
range 2800
line 0 -7.5
text -9.5 0 4 0 28
range 2900
line 0 -1.8
range 3000
line 0 -3.7
range 3100
line 0 -1.8
range 3200
line 0 -3.7
text -5.7 0 4 0 32
endpitchladder

pitchladder
ammotype 7_9mm_mg37t 3200
pos 45.1
range 0
line 0 7.5
text 9.5 0 4 0 0
range 200
line 0 3.7
text 5.7 0 4 0 2
range 400
line 0 7.5
text 9.5 0 4 0 4
range 600
line 0 3.7
text 5.7 0 4 0 6
range 800
line 0 7.5
text 9.5 0 4 0 8
range 1000
line 0 3.7
text 5.7 0 4 0 10
range 1200
line 0 7.5
text 9.5 0 4 0 12
range 1400
line 0 3.7
text 5.7 0 4 0 14
range 1600
line 0 7.5
text 9.5 0 4 0 16
range 1800
line 0 3.7
text 5.7 0 4 0 18
range 2000
line 0 7.5
text 9.5 0 4 0 20
endpitchladder

# fov should be last as it draws the main border circle cutout
fov 13