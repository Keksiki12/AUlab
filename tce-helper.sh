tce-load -wi ce-certificates
tce-load -wi quakeforge.tcz
tce-load -wi SDL.tcz
wget https://raw.githubusercontent.com/Keksiki12/AUlab/main/quakesw-1.0.6.tar.gz
wget https://raw.githubusercontent.com/Keksiki12/AUlab/main/sdlquake-1.0.9-bin.tar.gz
tar -xzf sdlquake-1.0.9-bin.tar.gz
tar -xzf quakesw-1.0.6.tar.gz
mkdir -p sdlquake-109/id1
cp id1/pak0.pak sdlquake-109/id1/
cp sdlquake sdlquake-109/
tce-load -wi git
tce-load -wi 7zip
tce-load -wi pcre2