#!/usr/bin/env bash
# 
# =============================================================================
# Sync sony walkman mp3 player with local disk
#
# Syncs both ways. At the end both locations have the newest version of each
# shared file. Rsync options used:
#
#
# --recursive             This tells rsync to copy directories recursively
# --update                skip files that are newer on the receiver
# --times                 preserve modification times
# --verbose               increase verbosity
# --size-only             Compare files on size and name only. Speeds up sync
#                             
# 
# Requirements
# ------------
# rsync
# notify-send
#
# Installation
# ------------
# To make this script runnable
# 
# $ git clone git@github.com:sjoerdk/bash_scripts.git
# $ cd bash_scripts
# $ sudo stow sync_walkman --target=/usr/local
#
# =============================================================================

local_dir=/home/sjoerdk/Music/WALKMAN
walkman_dir=/media/sjoerdk/WALKMAN
rsync_options='--recursive --update --times --verbose --size-only'

do_sync () {
  input_dir=$1
  target_dir=$2  
  
  echo "running 'rsync $rsync_options $input_dir/* $target_dir'"
  rsync $rsync_options $input_dir/* $target_dir
}

echo "Synching $local_dir and $walkman_dir"

do_sync $local_dir $walkman_dir
do_sync $walkman_dir $local_dir

echo "Done"
notify-send "Sync complete between $local_dir and $walkman_dir"
