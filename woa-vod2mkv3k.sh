#!/bin/bash

echo "Enter m3u8 link:"
read link

echo "Enter output filename (w/o extension):"
read filename

## SAVE STREAM ##
ffmpeg.exe -i "$link" -c:v copy -c:a copy "$filename.x264.mp4" && sleep 3

# recode 2 3k mkv
ffmpeg.exe -y -hwaccel_output_format cuda -c:v h264_cuvid -hwaccel nvdec -i "$filename.x264.mp4" -c:v hevc_nvenc -preset p1 -b_ref_mode 0 -b:v 3000000 -maxrate 6M -c:a copy -c:s copy -map 0 "$filename.x265.mkv"

## Original mp4 delete
#rm "$filename.x264.mp4"

#read -n 1 -s -r -p "Press any key to exit"

exit 0
