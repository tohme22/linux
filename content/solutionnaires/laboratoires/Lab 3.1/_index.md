---
title: "Laboratoire 3.1"
description: "linux"
draft: false
weight: 3
---
## Laboratoire 3.1 -  Solution

Question 1: 
```cmd
mkdir Music Pictures Videos
```

Question 2:
```cmd 
touch song1.mp3 song2.mp3 song3.mp3 song4.mp3 song5.mp3 song6.mp3
touch snap1.jpg snap2.jpg snap3.jpg snap4.jpg snap5.jpg snap6.jpg
touch film1.avi film2.avi film3.avi film4.avi film5.avi film6.avi
```

Question 3:
```cmd
mv song1.mp3 song2.mp3 song3.mp3 song4.mp3 song5.mp3 song6.mp3 Music
mv snap1.jpg snap2.jpg snap3.jpg snap4.jpg snap5.jpg snap6.jpg Pictures
mv film1.avi film2.avi film3.avi film4.avi film5.avi film6.avi Videos
ls -l Music Pictures Videos
```

Question 4:
```cmd 
mkdir friends family
```

Question 5:
```cmd  
cd friends
cp ../Music/song1.mp3 ../Music/song2.mp3 ../Pictures/snap1.jpg ../Pictures/snap2.jpg ../Videos/film1.avi ../Videos/film2.avi .
ls -l
cd ../family
cp ../Music/song3.mp3 ../Music/song4.mp3 ../Pictures/snap3.jpg ../Pictures/snap4.jpg ../Videos/film3.avi ../Videos/film4.avi .
ls -l
```

Question 6:
```cmd 
cd
rmdir friends family
```

Question 7:
```cmd 
rm -r family friends
ls -l
```