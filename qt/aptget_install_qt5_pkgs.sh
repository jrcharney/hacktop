#!/bin/bash
# File: aptget_install_qt5_pkgs.sh
# Author: Jason Charney (jrcharneyATgmailDOTcom)
# Date:   23 Nov 2015
# Info:   A script for installing the long list of packages Qt5
#         Remove from this list all the ones you have or apt-get will set those updates to manual.

sudo apt-get install libfontconfig1-dev libdbus-1-dev libfreetype6-dev libudev-dev \
                     libicu-dev libsqlite3-dev libxslt1-dev libssl-dev libasound2-dev \
                     libavcodec-dev libavformat-dev libswscale-dev libgstreamer0.10-dev \
                     libgstreamer-plugins-base0.10-dev gstreamer-tools \
                     gstreamer0.10-plugins-good gstreamer0.10-plugins-bad \
                     libraspberrypi-dev libpulse-dev libx11-dev libglib2.0-dev \
                     libcups2-dev freetds-dev libsqlite0-dev libpq-dev \
                     libiodbc2-dev libmysqlclient-dev firebird-dev libpng12-dev \
                     libjpeg62-dev libgst-dev libxext-dev libxcb1 libxcb1-dev \ 
                     libx11-xcb1 libx11-xcb-dev libxcb-keysyms1 libxcb-keysyms1-dev \ 
                     libxcb-image0 libxcb-image0-dev libxcb-shm0 \
                     libxcb-shm0-dev libxcb-icccm4 libxcb-icccm4-dev \
                     libxcb-sync0 libxcb-sync0-dev libxcb-render-util0 \ 
                     libxcb-render-util0-dev libxcb-xfixes0-dev libxrender-dev \
                     libxcb-shape0-dev libxcb-randr0-dev libxcb-glx0-dev \
                     libxi-dev libdrm-dev
