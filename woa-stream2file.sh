#!/bin/bash

echo "Enter m3u8 link:"
read link

echo "Enter output filename (w/o extension):"
read filename

## SAVE STREAM ##
ffmpeg.exe -i "$link" -c:v copy -c:a copy "$filename.mp4"

#read -n 1 -s -r -p "Press any key to exit"

exit 0
