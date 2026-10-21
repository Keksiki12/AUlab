tazpkg get-install slitaz-toolchain
tazpkg get-install libsdl-dev
tazpkg get-install libmad-dev
tazpkg get-install libvorbis-dev

wget http://archive.ubuntu.com/ubuntu/ubuntu/pool/universe/q/quakespasm/quakespasm_0.96.3+dfsg.orig.tar.xz
# unzip master.zip
unzip master.zip "quakespasm-master/Quake/*" -d .
cd quakespasm-master/Quake
make
wget https://raw.githubusercontent.com/Keksiki12/AUlab/main/PAK1.PAK
wget https://raw.githubusercontent.com/Keksiki12/alt/main/PAK0.PAK
cd ~
mkdir -p quake/id
mv PAK1.PAK /quake/id1/pak1.pak
mv PAK0.PAK /quake/id1/pak0.pak
cp quakespasm-master/Quake/quakespasm quake/
