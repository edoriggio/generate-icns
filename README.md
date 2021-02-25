# Generate .iconset and .icns files

This is a small shell script that allows you to create .iconset and .icns files. For the .iconset file, the script will generate **16x16**, **32x32**, **64x64**, 
**128x128**, **256x256**, **512x512** and **1024x1024** px images. This can be modified in the `generate_icns.py` file's `size` array.

## Prerequisites

- Python 3.x
- cv2 (which can be downloaded from the Terminal using the following command: `pip3 install opencv-python`)

## How to use it

1. Place the file `mkicon.sh` in `/usr/local/bin` (this can be done by using the command: `mv ./mkicon.sh /usr/local/bin`);
2. Place the file `generate_icns.py` in the home directory (this can be done by using the command: `mv ./generate_icns.py ~`);
3. Logout of your machine in order to save the changes;
4. Now you can use the command `mkicon [-i | -h] image destination` wherever you are

## Command

```bash
$ mkicon [-i | -h] [image] [destination]

options:
-i        Generate the .icns file
-h        Show a brief description of the command flags and arguments

image:
absolute path of the image you want to transform

destination:
absolute path of the destination directory where to save the .iconset and eventually the .icns files
```
