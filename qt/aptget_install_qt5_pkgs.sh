#!/bin/bash
# File: aptget_install_qt5_pkgs.sh
# Author: Jason Charney (jrcharneyATgmailDOTcom)
# Date:   23 Nov 2015
# Info:   A script for installing the long list of packages Qt5
#         Remove from this list all the ones you have or apt-get will set those updates to manual.
# NOTE: Even if you've installed ruby locally, go ahead and install the ruby packages.

sudo apt-get install \
		     autopoint \
		     bison \
		     comerr-dev \
		     debhelper \
		     dhelp \
		     firebird-dev firebird2.5-common firebird2.5-common-doc firebird2.5-server-common \
		     flex \
		     freetds-dev freetds-common \
		     gettext \
		     gir1.2-gst-plugins-base-0.10 gir1.2-gstreamer-0.10 \
		     gperf \
		     gstreamer-tools gstreamer0.10-gconf gstreamer0.10-tools gstreamer0.10-x gstreamer0.10-plugins-bad gstreamer0.10-plugins-good \
		     icu-devtools \
		     intltool-debian \
		     krb5-multidev \
		     libasound2-dev \
		     libasprintf-dev \
		     libatspi-dev \
		     libavahi-client-dev libavahi-common-dev \
                     libavcodec-dev libavformat-dev libavresample-dev libavutil-dev \
		     libcdaudio1 \
		     libct4 \
                     libcups2-dev \
                     libdbus-1-dev \
		     libdirac-encoder0 \
		     libdrm-dev \
		     libelfg0 \
		     libfbclient2 \
		     libfbembed2.5 \
		     libfontconfig1-dev \
		     libfreetype6-dev \
		     libgettextpo0 libgettextpo-dev \
                     libglib2.0-bin libglib2.0-dev \
		     libgssrpc4 \
		     libgst7 libgst-dev \
		     libgstreamer0.10-dev libgstreamer-plugins-bad0.10-0 libgstreamer-plugins-base0.10-dev \
		     libharfbuzz-dev \
		     libib-util \
                     libicu-dev \
		     libinput5 libinput-dev \
                     libiodbc2 libiodbc2-dev \
                     libjpeg62-turbo-dev \
		     libkadm5clnt-mit9 libkadm5srv-mit9 \
		     libkdb5-7 \
		     libmail-sendmail-perl \
		     libmpcdec6 \
		     libmysqlclient18 libmysqlclient-dev \
		     libpcre3-dev \
		     libpcrecpp0 \
		     libpng12-dev \
		     libpq5 libpq-dev \
		     libproxy-dev \
		     libpulse-dev libpulse-mainloop-glib0 \
                     libraspberrypi-dev \
		     libslv2-9 \
		     libsqlite0 libsqlite0-dev libsqlite3-dev \
		     libssl-dev \
		     libswscale-dev \
		     libsybdb5 \
		     libsys-hostname-long-perl \
		     libts-dev \
		     libudev-dev \
		     libunistring0 \
		     libx11-dev \
                     libx11-xcb1 libx11-xcb-dev \
		     libxcb1 libxcb1-dev \
		     libxcb-glx0-dev \
		     libxcb-icccm4 libxcb-icccm4-dev \
                     libxcb-image0 libxcb-image0-dev \
		     libxcb-keysyms1 libxcb-keysyms1-dev \
		     libxcb-randr0-dev \
		     libxcb-render-util0 libxcb-render-util0-dev \
                     libxcb-shape0-dev \
		     libxcb-shm0 libxcb-shm0-dev \
                     libxcb-sync1 libxcb-sync-dev \
		     libxcb-xfixes0-dev \
		     libxcb-xkb-dev \
		     libxext-dev \
                     libxi-dev \
		     libxkbcommon-dev libxkbcommon-x11-dev \
		     libxml2-dev \
		     libxrender-dev \
		     libxslt1-dev \
		     libzvbi-common libzvbi0 \
		     mtdev-tools libmtdev-dev \
		     mysql-common \
		     pkg-config \
		     po-debconf \
		     pulseaudio \
		     doc-base libappconfig-perl libasound2-plugins libatk1.0-dev libatspi1.0-0 \
		     libbonobo2-0 libbonobo2-common libbonobo2-dev \
		     libclass-accessor-chained-perl libclass-accessor-perl \
		     libdata-page-perl \
		     libhtml-parser-perl libhtml-tagset-perl \
		     libidl-dev libidl0 \
		     liborbit-2-0 liborbit2 liborbit2-dev \
		     libpopt-dev \
		     libpulsedsp \
		     libspeexdsp1 \
		     libsub-name-perl \
		     libtemplate-perl \
		     liburi-perl \
		     libuuid-perl \
		     libwebrtc-audio-processing-0 \
		     orbit2 \
		     pstotext \
		     pulseaudio-module-x11 pulseaudio-utils \
		     rtkit \
		     ruby-bdb \
		     ruby-debian \
		     ruby-gettext \
		     ruby-locale \
		     ruby-text \
		     swish++

# Uncomment the line below if you'd rather install cmake from the repo
# rather than from source.
# sudo apt-get install cmake cmake-data

