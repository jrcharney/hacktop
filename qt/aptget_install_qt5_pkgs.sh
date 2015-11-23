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
                     libjpeg62-turbo-dev libgst-dev libxext-dev libxcb1 libxcb1-dev \
                     libx11-xcb1 libx11-xcb-dev libxcb-keysyms1 libxcb-keysyms1-dev \
                     libxcb-image0 libxcb-image0-dev libxcb-shm0 \
                     libxcb-shm0-dev libxcb-icccm4 libxcb-icccm4-dev \
                     libxcb-sync1 libxcb-sync-dev libxcb-render-util0 \
                     libxcb-render-util0-dev libxcb-xfixes0-dev libxrender-dev \
                     libxcb-shape0-dev libxcb-randr0-dev libxcb-glx0-dev \
                     libxi-dev libdrm-dev autopoint comerr-dev debhelper firebird2.5-common \
		     firebird2.5-common-doc firebird2.5-server-common freetds-common gettext \
		     gir1.2-gst-plugins-base-0.10 gir1.2-gstreamer-0.10 gstreamer0.10-gconf \
		     gstreamer0.10-tools gstreamer0.10-x icu-devtools intltool-debian \
		     krb5-multidev libasprintf-dev libavahi-client-dev libavahi-common-dev \
		     libavresample-dev libavutil-dev libcdaudio1 libct4 libdirac-encoder0 \
		     libelfg0 libfbclient2 libfbembed2.5 libgettextpo-dev libgettextpo0 \
                     libglib2.0-bin libgssrpc4 libgst7 libgstreamer-plugins-bad0.10-0 libib-util \
		     libiodbc2 libkadm5clnt-mit9 libkadm5srv-mit9 libkdb5-7 libmail-sendmail-perl \
		     libmpcdec6 libmysqlclient18 libpcre3-dev libpcrecpp0 libpq5 libpulse-mainloop-glib0 \
		     libslv2-9 libsqlite0 libsybdb5 libsys-hostname-long-perl libunistring0 libxml2-dev \
		     libzvbi-common libzvbi0 mysql-common po-debconf
