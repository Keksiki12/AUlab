tazpkg get-install slitaz-toolchain
tazpkg get-install libsdl-dev
tazpkg get-install libmad-dev
tazpkg get-install libvorbis-dev

wget https://github.com/sezero/quakespasm/archive/refs/heads/master.zip
unzip master.zip
cd quakespasm-master/Quake
make
wget https://raw.githubusercontent.com/Keksiki12/AUlab/PAK1.PAK
wget https://raw.githubusercontent.com/Keksiki12/alt/PAK0.PAK
cd ~
mkdir -p quake/id
mv PAK1.PAK /quake/id1/pak1.pak
mv PAK0.PAK /quake/id1/pak0.pak
cp quakespasm-master/Quake/quakespasm quake/