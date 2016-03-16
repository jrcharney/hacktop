#!/bin/bash

mirror="http://ports.ubuntu.com/pool/universe/c/chromium-browser"
# Alternatively, try https://dl.dropboxusercontent.com/u/87113045/

version="48.0.2564.82-0ubuntu0.15.04.1.1193"

here=$(pwd)

if [[ ! -d ~/Software/chrome/ ]]; then
	mkdir -p ~/Software/chrome/
fi
cd ~/Software/chrome/

curl -SLO ${mirror}/chromium-codecs-ffmpeg-extra_${version}_armhf.deb
curl -SLO ${mirror}/chromium-browser-l10n_${version}_all.deb
curl -SLO ${mirror}/chromium-browser_${version}_armhf.deb
sudo dpkg -i chromium-codecs-ffmpeg-extra_${version}_armhf.deb \
               chromium-browser-l10n_${version}_all.deb \
               chromium-browser_${version}_armhf.deb

cd $here
