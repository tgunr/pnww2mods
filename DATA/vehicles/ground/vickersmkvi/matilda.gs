# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 1.9
#mag 1

thinline 0 30 0 -30
thickline 0 30 0 500 1
thickline 0 -500 0 -30 1
#thinline 30 0 -30 0

text -100 -50 8 0 GUN
text 100 -50 8 0 MG

pitchladder
ammotype 40mml50ap 2000
pos 0
range 0
line -3 3
# 500 yds
range 457.2
line -30 30
thinline -20 0 -20 -2
thinline -10 0 -10 -2
thinline 10 0 10 -2
thinline 20 0 20 -2
thickline -95 0 -30 0 1
thickline -103 0 -500 0 1
thickline 30 0 95 0 1
thickline 103 0 500 0 1
text -100 0 7 0 5
text 100 0 7 0 4
# 1000 yds
range 914.4
line -3 3
text -100 0 7 0 10
text 100 0 7 0 8
# 1500 yds
range 1371.5
line -3 3
text -100 0 7 0 15
text 100 - 7 0 12
endpitchladder

#pitchladder
#ammotype 303tracer 1500
#pos 0
## 200 yds
#range 182.9
#text 100 0 7 0 2
## 400 yds
#range 365.7
#text 100 0 7 0 4
## 600 yds
#range 548.6
#text 100 0 7 0 6
#endpitchladder


# fov should be last as it draws the main border circle cutout
fov 21