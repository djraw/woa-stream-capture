@echo off

set /p "link=Enter m3u8 link: "

set /p "filename=Enter output filename (w/o extension): "

rem ## SAVE STREAM ##
ffmpeg.exe -i "%link%" -c:v copy -c:a copy "%filename%.x264.mp4"

timeout 3

rem # recode 2 3k mkv
ffmpeg.exe -y -hwaccel_output_format cuda -c:v h264_cuvid -hwaccel nvdec -i "%filename%.x264.mp4" -c:v hevc_nvenc -preset p1 -b_ref_mode 0 -b:v 3000000 -maxrate 6M -c:a copy -c:s copy -map 0 "%filename%.x265.mkv"

rem ## Original mp4 delete
del "%filename%.x264.mp4"

exit 0