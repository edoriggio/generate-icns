#!/bin/sh

# Copyright 2020 Edoardo Riggio
# 
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
# 
#        http://www.apache.org/licenses/LICENSE-2.0
# 
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

mkicon() {
    FILE=$1
    DEST=$2
    ICNS=$3

    mkdir $DEST
    ./generate_icns.py $FILE $DEST

    if [[ $ICNS == 'y' ]] || [[ $ICNS == 'Y' ]]
    then
        iconutil -c icns $DEST
    fi
}

DIRNAME='/icon.iconset'
ICON='y'

echo 'Specify the image path:'
read path

echo '----------------------------'
echo 'Specify the destination path:'
read dest

DIRPATH=$dest$DIRNAME

echo '-----------------------------------'
echo 'Do you want a .icns file too? [Y/n]'
read icon

if [ $icon != '' ] && [ $icon != $ICON ]
then
    ICON=$icon
fi

mkicon $path $DIRPATH $ICON
