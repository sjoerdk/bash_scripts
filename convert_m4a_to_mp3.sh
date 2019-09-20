#!/usr/bin/env bash
# 
# =============================================================================
# Convert an m4a file to mp3
#
# I do this regularly with mixcloud downloaded mixes. I don't want to manual 
# steps
# 
# Tips
# ----
# Run this as a batch:
# find *.m4a | xargs -d "\n" -I thefile convert_m4a_to_mp3.sh thefile
# (-d "\n") to make sure filenames with spaces and dashes do not cause trouble
# 
# =============================================================================

usage="Usage: $(basename "$0") [-h] MP4_FILE
       Convert MP4_FILE to mp3 file using ffmpeg
              
      -h  show this help text"


while getopts 'h' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))

if [ -z "$1" ]
  then
    echo "No argument supplied"
    echo "$usage"
    exit
fi


input_file=$1
full_filename=$(basename -- "$input_file")
base_path=$(dirname -- "$input_file")
extension="${full_filename##*.}"
filename="${full_filename%.*}"
output_file="$base_path/$filename.mp3"

ffmpeg -i "$input_file" -y -ac 2 -ab 192k "$output_file"

