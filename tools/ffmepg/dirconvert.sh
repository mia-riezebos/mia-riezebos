#! /bin/bash
#
# Quickly convert all the files of a certain filetype in a directory to another filetype using ffmpeg (useful for say, converting wav to ogg for sharing).

inext="wav"         # input filetype/extension
outext="ogg"        # output filetype/extension   !!(also change codec)!!
codec="libvorbis"   # output codec
bitrate="128k"      # output bitrate

for file in *\.$inext                             # loop through all the files with the given input filetype/extension
  do 
    output=$(echo $file | sed 's/.$inext\//g')    # remove the input file extension for output filename
    ffmpeg -y -i $file\                           # ffmpeg with the current file as input
      -c:a $codec -b:a $bitrate -vn\              # set audio codec & bitrate
      $output\.$outext                            # output filename & extension
  done
