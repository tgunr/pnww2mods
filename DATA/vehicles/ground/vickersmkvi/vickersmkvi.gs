# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 1.9
#mag 1

# this is the No 33 Mk IVS british tank gunsight
# all angles are in minutes (60 minutes = 1 degree) converted to mils
# ratio 1mil = 3.428min, 1min = 0.291mil

thickline 0 34.9 0 500 1
thickline 0 -500 0 -34.9 1

text 85 6 5 0 M G

text -88 6 5 0 A P

text -20 120 6 0 2  P D R.
text 15 120 6 0 G U N

pitchladder
ammotype 40mml50ap 3000
pos 0
range 0
line -0.873 0.873
thinline 0 0 0 0.873
pos -81.4
text -5 0 5 0 0
line -0.873 0.873
thinline 0 0 0 0.873
pos 0
 

# 500 yds
range 457.1
pos 0
rangeline 0 0 0 365.85
pos -81.4
rangeline 0 0 0 365.85
pos 0

thickline -78.5 0 -34.9 0 1
thickline -94.2 0 -500 0 1
thickline 34.9 0 78.5 0 1
thickline 94.2 0 500 0 1

thinline 2.91 0 5.82 0
thinline 11.64 0 14.55 0
thinline 20.37 0 23.28 0
thinline 29.1 0 32.01 0
thinline -2.91 0 -5.82 0
thinline -11.64 0 -14.55 0
thinline -20.37 0 -23.28 0
thinline -29.1 0 -32.01 0

thinline 8.73 0 8.73 -9.312
thinline -8.73 0 -8.73 -9.312
thinline 17.46 0 17.46 -5.529
thinline -17.46 0 -17.46 -5.529
thinline 26.19 0 26.19 -1.746
thinline -26.19 0 -26.19 -1.746

# 1000 yds
range 914.6
pos 0
rangeline 0 731.7 0 1097.56
rangeline -0.873 1097.6 0.873 1097.6
thinline 
pos -81.4
rangeline 0 731.7 0 1097.56
rangeline -0.873 1097.6 0.873 1097.6
pos 81.4
rangeline 0 731.7 0 1097.56
rangeline -0.873 1097.6 0.873 1097.6
pos 0

# 1500 yds
range 1372
pos 0
rangeline -1.746 1463.4 1.746 1463.4
rangeline 0 1413.4 0 1513.4
pos -81.4
rangeline -1.746 1463.4 1.746 1463.4
rangeline 0 1413.4 0 1513.4
pos 81.4
rangeline -1.746 1463.4 1.746 1463.4
rangeline 0 1413.4 0 1513.4
pos 0

# 2000 yds
range 1829
pos 0
rangeline -0.873 1829.3 0.873 1829.3
pos -81.4
rangeline -0.873 1829.3 0.873 1829.3
pos 81.4
rangeline -0.873 1829.3 0.873 1829.3
text 9.4 0 5 0 12
pos 0

# 2500 yds
range 2287
pos 0
thinline 2.037 0 -2.037 0
pos 81.4
thinline 2.037 0 -2.037 0
text 5.4 0 5 0 16
pos 0


# 400 yards
pos -81.4
range 365.8
text -9 0 5 0 4

# 800 yards
range 731.7
pos -81.4
text -5 0 5 0 8
pos 81.4
text 5 0 5 0 5

# 1200 yards
range 1097.6
pos -81.4
text -9.4 0 5 0 12
pos 81.4
text 9 0 5 0 8

# 1600 yards
range 1463.4
pos -81.4
text -5.4 0 5 0 16
pos 81.4
text 5.4 0 5 0 10

pos 0


#text -100 0 7 0 5
#text 100 0 7 0 4
# 1000 yds
range 914.4
#line -3 3
#text -100 0 7 0 10
#text 100 0 7 0 8
# 1500 yds
range 1371.5
#line -3 3
#text -100 0 7 0 15
#text 100 - 7 0 12
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