#! /bin/bash
#
# Quickly convert all the files of a certain filetype in a directory to another filetype using ffmpeg (useful for say, converting wav to ogg for minecraft resource packs).

INEXT="wav"                                       # input filetype/extension
OUTEXT="ogg"                                      # output filetype/extension   !!(also change codec)!!
CODEC="libvorbis"                                 # output codec
BITRATE="128k"                                    # output bitrate
read -e -p "Working directory: " -i "./" DIR      # working directory (where to find the files)

cd $DIR
mkdir -p ./out
for FILE in *\.$INEXT                             # loop through all the files with the given input filetype/extension
  do 
    OUTPUT=$(echo $FILE | sed "s/.$INEXT\//g")        # remove the input file extension for output filename
    ffmpeg -loglevel info -y -i $FILES            `# ffmpeg with $file as input`\
      -c:a $CODEC -b:a $BITRATE -vn              `# set codec and bitrate, ignore video`\
      ./out/$OUTPUT\.$OUTEXT                     `# set output`
  done
