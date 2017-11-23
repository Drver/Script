#!/usr/bin/env python
# -*- encoding: utf-8 -*-
# vim: set et sw=4 ts=4 sts=4 ff=unix fenc=utf8:

import sys
import os
import random

img_suffixs = ['jpg', 'png']

if len(sys.argv) > 2:
    
    imgPath = sys.argv[1]
    if not imgPath.endswith(os.sep):
        imgPath = imgPath + os.sep
    fileList = os.listdir(imgPath)
    
    imgList = []
    fileListLen = len(fileList)
    for i in range(fileListLen):
        if not fileList[i].startswith('.'):
            if fileList[i].split('.')[-1] in img_suffixs:
                imgList.append(fileList[i])
    
    randomIndex = random.randint(0, len(imgList))
    targetImg = imgList[randomIndex]
    
    if not targetImg == sys.argv[2]:
        os.rename(imgPath + sys.argv[2], imgPath + 'temp')
        os.rename(imgPath + targetImg, imgPath + sys.argv[2])
        os.rename(imgPath + 'temp', imgPath + targetImg)
