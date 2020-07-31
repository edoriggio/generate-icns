#!/usr/bin/env python3

import cv2
import sys


def generate_iconset(image, destination):
    sizes = [16, 32, 64, 128, 256, 512, 1024]

    for i in range(len(sizes)):
        width_height = sizes[i]
        dimensions = (width_height, width_height)

        try:
            resized_image = cv2.resize(image, dimensions)
            cv2.imshow('resized', resized_image)
            cv2.imwrite('{}/icon_{}x{}.png'.format(destination, sizes[i], sizes[i]), resized_image)
        except:
            print('Images could not be saved, check your image and destination paths')
            break


if __name__ == "__main__":
    path = str(sys.argv[1])
    destination = str(sys.argv[2])
    img = cv2.imread(path, cv2.IMREAD_UNCHANGED)

    generate_iconset(img, destination)
