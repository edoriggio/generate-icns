#!/usr/bin/env python3

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
