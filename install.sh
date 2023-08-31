#!/usr/bin/env zsh

# This file will setup the python environment.
#

# Check to see if we are already in a python virtual environment.
# If not, then set one up.
#

EXECDIR=${0:a:h}
OLDDIR=$(pwd)

if [ $OLDDIR != $EXECDIR ]
then
  echo "Execute this script in the directory where the script resides."
  exit 1
fi

VENVAVAIL=$(dpkg -l | sed -n -E "/python3.*-venv/p" | wc -l)
if [ $VENVAVAIL -le 0 ]
then
  echo "Please ensure the venv module is installed for python."
  echo ""
  echo "For example: sudo apt install python3-venv"
  exit 1
fi

if [ ! -n "$VIRTUAL_ENV" ]
then
  echo "Please ensure that you are in a python virtual environment."
  echo ""
  echo "For example:"
  echo "     python3 -m venv env"
  echo "     source env/bin/activate"
  exit 1
fi 

pip install -r ./requirements.txt
