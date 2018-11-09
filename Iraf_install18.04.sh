# Version - Ricardo Cezar Volert [UTFPR]
# 2018-nov-09
# November 18' - ricardovolert@gmail.com
# Verify in Ubuntu 18.04
#=========================================================================
# GLOBAL PARAMETERS
USERFOLDER = /home/ricardo/
DOWNLOADFOLDER = /home/ricardo/Download/Iraf-Installer/

#=========================================================================
#Create Desktop link (Only Case of Linux in pt-BR)
ln -s $USERFOLDER/'Área de Trabalho'/ $USERFOLDER/desktop/ 

#========================================================================
# PART 0: make the bed
#========================================================================

sudo dpkg --add-architecture i386

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ trusty main restricted"

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ trusty main universe"

sudo apt-get update

sudo apt-get install -f -y git xauth xorg xserver-xorg xserver-xorg-core

#========================================================================
# PART 1: libXmu
#========================================================================
# Download by https://gitlab.freedesktop.org/xorg/lib/libxmu

tar -zxf libxmu.tar.gz

cd libxmu/

bash autogen.sh

sudo apt-get install -f -y tcsh libxss1 lib32z1 lib32ncurses5 lib32bz2-1.0 libxmu6:i386

sudo apt-get install -f -y tcsh libxss1 lib32z1 lib32ncurses5 libxmu6 libxmu6:i386 libbz2-1.0:i386 libz1:i386 libncurses5:i386 libbz2-1.0:i386 libstdc++6:i386

cd $DOWNLOADFOLDER

rm -r libxmu

#========================================================================
# PARTE 2: IRAF
#========================================================================
# Unfortunately, the link of IRAF is a bad link 
# ftp://iraf.noao.edu/iraf/v216/PCIX/iraf.lnux.x86_64.tar.gz
# sha1sum = 2de1bbf225dff095a11ad19a4cc279f3d02c61bd

sudo mkdir /iraf

sudo mkdir /iraf/iraf

cd $DOWNLOADFOLDER

sudo cp iraf.lnux.x86_64.tar.gz /iraf/iraf/.

cd /iraf/iraf

sudo tar -zxf iraf.lnux.x86_64.tar.gz

sudo rm iraf.lnux.x86_64.tar.gz

sudo ./install

#[[Keep hitting Enter for all prompts]]

sudo mkdir /iraf/x11iraf

cd /iraf/x11iraf

cp $DOWNLOADFOLDER/x11iraf-v2.0BETA-bin.linux.tar.gz /iraf/x11iraf/ 

#sudo wget http://iraf.noao.edu/iraf/ftp/iraf/x11iraf/x11iraf-v2.0BETA-bin.linux.tar.gz
# sha1sum = 77b0d340e1321f68fefea02ab300b37d69a2a11e

sudo tar -zxf x11iraf-v2.0BETA-bin.linux.tar.gz

sudo rm x11iraf-v2.0BETA-bin.linux.tar.gz

sudo ./install

#[[Keep hitting Enter for all prompts]] 
#**************************
# for install X11, accept the default ways 
#/usr/local/bin
#/usr/share/man/man1
#/usr/lib/app-defaults
#/usr/local/lib
#/usr/local/include
# wait installation complete
#**************************

#========================================================================
# PART 3: DS9
#========================================================================
#The link http://ds9.si.edu/archive/linux64/ds9.linux64.7.2.tar.gz is more or less stable, if compared with iraf link
#sha1sum = 6e97b3a9a18c9e8cdd416a195c67d8a63872647b

cd $DOWNLOADFOLDER/ds9.linux64.7.2.tar.gz 

sudo tar -zxf ds9.linux64.7.2.tar.gz

sudo mv ds9 /usr/local/bin/.

cd

#========================================================================
# PART 4: Command and login in IRAF with DS9
#========================================================================
#The link http://www.astronomy.ohio-state.edu/~khan/iraf/iraf is more or less stable, if compared with other's link

cp $DOWNLOADFOLDER/iraf $USERFOLDER/

cd $USERFOLDER

sudo chmod u=rwx iraf

mkdir IRAF

cd IRAF

mkiraf

cd

echo 'Instalation Complete: Execute in terminal: cd ; ./iraf'

echo In $USERFOLDER: ./iraf
