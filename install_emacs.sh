sudo apt-get install build-essential
sudo apt-get build-dep emacs24
cd ~/Downloads
wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
tar xf emacs-24.5.tar.gz
cd emacs-24.5
./configure
make
sudo make install
