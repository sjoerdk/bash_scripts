#!/usr/bin/env bash
# 
# =============================================================================
# Concert an m4a file to mp3
#
# I do this regularly with mixcloud downloaded mixes. I don't want to manual 
# steps
# 
#
# Bash style following https://github.com/bahamas10/bash-style-guide#bashisms
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

echo $output_file

ffmpeg -i $input_file -ac 2 -ab 192k $output_file
