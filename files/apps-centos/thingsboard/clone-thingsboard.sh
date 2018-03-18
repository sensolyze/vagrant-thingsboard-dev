#!/bin/bash

# get source sub directory
SOURCE_SUBDIR=`hostname`

# clone thingsboard repo from sensolyze
SOURCE_DIR=/vagrant/source/$SOURCE_SUBDIR
echo "Source Directory = $SOURCE_DIR"
if [ ! -d "$SOURCE_DIR" ]
then
  sudo mkdir -p "$SOURCE_DIR"
  sudo chown vagrant $SOURCE_DIR
  sudo chgrp vagrant $SOURCE_DIR
fi
if [ ! -d "$SOURCE_DIR/thingsboard" ]
then
  echo "Clone git@github.com:sensolyze/thingsboard.git to $SOURCE_DIR"
  cd $SOURCE_DIR
  git clone git@github.com:sensolyze/thingsboard.git
fi
