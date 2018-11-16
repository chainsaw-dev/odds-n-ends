#!/bin/bash

# this tool, will go through an entire dir full of X and action tasks based on X
# handy in various situations ..


REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR=`pwd`

IFS=$'\n'

for REPO in `ls "$REPO_DIR/"`
do
  if [ -d "$REPO_DIR/$REPO" ]
  then
    echo "Updating $REPO_DIR/$REPO at `date`"
    if [ -d "$REPO_DIR/$REPO/.git" ]
    then
      cd "$REPO_DIR/$REPO"
      git status
      echo "Fetching"
      git fetch
      echo "Pulling"
      git pull
    else
      echo "Skipping because it doesn't look like it has a .git folder."
    fi
    echo "Done at `date`"
    echo
  fi
done
