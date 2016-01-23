# gunsight file
#
# coordinates are 0,0 at boresight, -x is left and -y is down
#
# coordinates are in mils, fov in degrees
# 1 deg = 17.45 mils, 1 mil = 0.05730 deg

# mag should be 1st line, as it sets the field of view in the game
mag 1.5
#mag 1

#setrangeanglemax 0.0

#setrangeanglemin 5.9
#setrangeanglemax -5.5

#triangle -12 0 -13.25 -2 -10.75 -2

#thickline 90 60 190 140 1
#thickline 48 20 98 80 1
#thickline 20 0 100 60 1
#thickline 0 -40 0 -500 1
#thickline 0 40 0 500 1
thinline 0 -6 0 -500
thinline 0 6 0 500

#thinline 200 -100 -280 500

#text 30 120 8 -51 1k
#text 50 100 8 -51 1k
#thinline 47 97 44 94
#thinline 0 0 -2.25 -3.5
#thinline 0 0 2.25 -3.5
thinline 6 -0 60 -0
thinline -6 0 -60 -0
thinline 64 0 120 0
thinline -64 0 -120 0
#thinline 0 -0 500 -0

thinline 0 6 -6 0 
thinline -6 0 0 -6
thinline 0 -6 6 0
thinline 6 0 0 6
###ALT Pitch ladder
#text -164 106 12 0 KM
#thinline -162 -100 -162 100
#text -150 100 10 0 6.0
#thinline -162 100 -172 100
#text -150 100 10 0 6.0
#thinline -162 90 -167 90
#text -150 90 10 0 5.8
#thinline -162 80 -172 80
#text -150 80 10 0 5.5
#thinline -162 70 -167 70
#text -150 70 10 0 5.3
#thinline -162 60 -172 60
#text -150 60 10 0 5.0
#thinline -162 50 -167 50
#text -150 50 10 0 4.8
#thinline -162 40 -172 40
#text -150 40 10 0 4.5
#thinline -162 30 -167 30
#text -150 30 10 0 4.3
#thinline -162 20 -172 20
#text -150 20 10 0 4.0
#thinline -162 10 -167 10
#text -150 10 10 0 3.7
#thinline -162 0 -172 0
#text -150 0 10 0 3.5
#thinline -162 -10 -167 -10
#text -150 -10 10 0 3.2
#thinline -162 -20 -172 -20
#text -150 -20 10 0 3.0
#thinline -162 -30 -167 -30
#text -150 -30 10 0 2.7
#thinline -162 -40 -172 -40
#text -150 -40 10 0 2.4
#thinline -162 -50 -167 -50
#text -150 -50 10 0 2.2
#thinline -162 -60 -172 -60
#text -150 -60 10 0 1.9
#thinline -162 -70 -167 -70
#text -150 -70 10 0 1.7
#thinline -162 -80 -172 -80
#text -150 -80 10 0 1.4
#thinline -162 -90 -167 -90
#text -150 -90 10 0 1.2
#thinline -162 -100 -172 -100
#text -150 -100 10 0 0.9

###Speed Pitch ladder
#text 165 64 8 0 KPH
#thinline 162 60 172 60
#text 150 60 10 0 480
#thinline 162 50 167 50
#text 150 50 10 0 444
#thinline 162 40 172 40
#text 150 40 10 0 406
#thinline 162 30 167 30
#text 150 30 10 0 370
#thinline 162 20 172 20
#text 150 20 10 0 333
#thinline 162 10 167 10
#text 150 10 10 0 298
#thinline 162 0 172 0
#text 150 0 10 0 262
#thinline 162 -10 167 -10
#text 150 -10 10 0 225
#thinline 162 -20 172 -20
#text 150 -20 10 0 189
#thinline 162 -30 167 -30
#text 150 -30 10 0 154
#thinline 162 -40 172 -40
#text 150 -40 10 0 115
#thinline 162 -50 167 -50
#text 150 -50 10 0 80
#thinline 162 60 162 -50



###Timing Arc
#thinline 70 300 70 200
#thinline 70 200 90 100
#thinline 90 100 140 0
#thinline 140 0 190 -50
#thinline 190 -50 280 -100
#thinline 280 -100 400 -120
#trianglefill 110 60 330 220 300 220

###Alt adjustment pointer
#ladder vertical+ bombsightalt 915m 6097m 200
#trianglefill -170 -100 -330 -90 -330 -110

###Speed adjustment pointer
#ladder vertical+ bombsightspeed 80kph 500kph 115
#trianglefill 170 -50 330 -60 330 -40


# fov should be last as it draws the main border circle cutout
fov 30