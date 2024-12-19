#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

#enable non-free
sed -i 's/main/main non-free/g' /etc/apt/sources.list.d/debian.sources

apt-get update 
apt-get install -y --no-install-recommends --no-upgrade \
unrar git python3 ca-certificates 