#!/bin/sh

tazpkg -gi tazpkg --forced
tazpkg -gi gcc
tazpkg -gi make
tazpkg -gi libsdl-dev

mkdir -p /home/tux/quake
cd /home/tux/quake
wget https://icculus.org/~ravage/quake/sdlquake-1.0.9-bin.tar.gz
wget https://www.libsdl.org/projects/quake/data/quakesw-1.0.6.tar.gz
tar -xzf sdlquake-1.0.9-bin.tar.gz
tar -xzf quakesw-1.0.6.tar.gz
rm -f *.tar.gz
export DISPLAY=:0
