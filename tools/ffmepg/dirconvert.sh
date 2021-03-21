#! /bin/bash
#
# Quickly convert all the files of a certain filetype in a directory to another filetype using ffmpeg (useful for say, converting wav to ogg for sharing).

inext="wav"        # input filetype
outext="ogg"       # output filetype (also change codec)
codec="libvorbis"   # output codec
bitrate="128k"      # output bitrate

for file in *\.$inext 
  do 
    output=$(echo $file | sed 's/.$inext\//g')
    ffmpeg -y -i $file\
      -c:a $codec -b:a $bitrate -vn\
      $output\.$outext
  done
