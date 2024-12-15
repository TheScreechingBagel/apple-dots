#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo 'Extracting webcam firmware from bootcamp drivers @ Apples CDN'

git clone https://github.com/nlitsme/zipdump
cd zipdump
python3 zipdump.py https://download.info.apple.com/Mac_OS_X/031-30890-20150812-ea191174-4130-11e5-a125-930911ba098f/bootcamp5.1.5769.zip --save BootCamp/Drivers/Apple/AppleCamera64.exe

echo 'Extracting and installing the sensor calibration files from the .exe' # as described here https://github.com/patjak/facetimehd/wiki/Extracting-the-sensor-calibration-files

cd BootCamp/Drivers/Apple/
unrar x AppleCamera64.exe

mkdir -p /out/lib/firmware/facetimehd

dd bs=1 skip=1663920 count=33060 if=AppleCamera.sys of=/out/lib/firmware/facetimehd/9112_01XX.dat
dd bs=1 skip=1644880 count=19040 if=AppleCamera.sys of=/out/lib/firmware/facetimehd/1771_01XX.dat
dd bs=1 skip=1606800 count=19040 if=AppleCamera.sys of=/out/lib/firmware/facetimehd/1871_01XX.dat
dd bs=1 skip=1625840 count=19040 if=AppleCamera.sys of=/out/lib/firmware/facetimehd/1874_01XX.dat