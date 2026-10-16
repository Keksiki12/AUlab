#!/bin/sh

tazpkg get-install gcc
tazpkg get-install make
tazpkg get-install pkg-config
tazpkg get-install libgtk-3-dev
tazpkg get-install libx11-dev
tazpkg get-install libxcomposite-dev
tazpkg get-install libxfixes-dev

cd /home/tux
wget https://github.com/Roam45/Linux-FPS-Tracker/archive/refs/heads/master.tar.gz -O fps-tracker.tar.gz
tar -xzf fps-tracker.tar.gz
rm fps-tracker.tar.gz
cd Linux-FPS-Tracker-master

g++ -o fps_tracker main.cpp `pkg-config --cflags --libs gtk+-3.0` -lX11 -lXcomposite -lXfixes -std=c++11 -pthread
