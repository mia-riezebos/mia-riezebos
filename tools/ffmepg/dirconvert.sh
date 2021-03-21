#! /bin/bash
#
# Quickly convert all the files of a certain filetype in a directory to another filetype using ffmpeg (useful for say, converting wav to ogg for sharing).

inext="wav"                                       # input filetype/extension
outext="ogg"                                      # output filetype/extension   !!(also change codec)!!
codec="libvorbis"                                 # output codec
bitrate="128k"                                    # output bitrate
read -e -p "Working directory: " -i "./" dir      # working directory (where to find the files)

cd $dir
mkdir ./out
for file in *\.$inext                             # loop through all the files with the given input filetype/extension
  do 
    output=$(echo $file | sed "s/.wav//g")        # remove the input file extension for output filename
    ffmpeg -loglevel error -y -i $file           `# ffmpeg with $file as input`\
      -c:a $codec -b:a $bitrate -vn              `# set codec and bitrate, ignore video`\
      ./out/$output\.$outext                     `# set output`
  done
