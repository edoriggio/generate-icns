#!/bin/sh

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
