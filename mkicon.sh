#!/bin/sh

# Copyright 2020 Edoardo Riggio
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

while getopts 'ih' flag; do
  case "${flag}" in
    i) ICNS='y' ;;
    h) HELP='true'
       echo "mkicon [options] image destination"
       echo " "
       echo "options:"
       echo "-h         show brief help"
       echo "-f         create a .icns file"
       exit 0 ;;
    \?) exit 42 ;;
  esac
done

if [[ $# < 2 ]]
then
    echo Both an image path and a destination path must be passed to mkicon
    exit 1
fi

shift $((OPTIND - 1))

FILE=$1
DEST=$2

DIRNAME='/icon.iconset'
DESTDIR=$DEST$DIRNAME

mkdir $DESTDIR
./generate_icns.py $FILE $DESTDIR

if [[ $ICNS == 'y' ]]
then
    iconutil -c icns $DESTDIR
fi
