#!/bin/bash

# Written by Ian Nesbitt, 2017. Distributed under MIT License.
# Converts set of images to size limit and then renders to timelapse
# Requires ffmpeg and imagemagick
# (see https://www.ffmpeg.org/ and https://www.imagemagick.org/)

# frames per second
FPS=24

# image type (png, jpg, tiff)
imgtype=jpg

# the file
FILE=vid.mp4

# the image repository
LOC=$(pwd) # get current folder (default)

# temporary processing folder and video destination folder
TMP=$LOC/tmp
DEST=$LOC/0video
mkdir $TMP
mkdir $DEST

if [ -d "$LOC" ]; then
  cd "$LOC"

  # writes list of files, numbers each list item,
  # stores number and filename as vars, then renames files with numbering.
  # numbering is in %d format starting at 1.jpg
  ls *.$imgtype | cat -n | while read n f; do convert "$f" -resize 2048x2048\> "$TMP/$n.$imgtype"; done
  cd $TMP

  # converts filenames with %d format to mp4 at desired FPS (above) starting at tmp/1.jpg
  # by default, video will output to 0video/vid.mp4
  ffmpeg -y -start_number 1 -r $FPS  -i \%d.$imgtype -c:v libx264 "$DEST/$FILE"

  # using the assumed noon image as the cover image
  # not a huge deal if not there; video will default to first frame

  # removes temp folder (uncomment if
  #cd ../; rm -r $TMP

fi
