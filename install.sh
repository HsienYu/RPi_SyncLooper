#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Must be root"
	exit
fi

cp -a playvideos.sh /home/pi/
cp -a configfile.txt /boot/
cp -a ssh /boot/
cp -a wpa_supplicant.conf /boot/
chmod +x /home/pi/playvideos.sh
apt-get remove omxplayer
rm -rf /usr/bin/omxplayer /usr/bin/omxplayer.bin /usr/lib/omxplayer
apt-get install libpcre3 fonts-freefont-ttf fbset libssh-4 python3-dbus exfat-fuse exfat-utils
wget http://omxplayer.sconde.net/builds/omxplayer_0.3.7~git20160713~66f9076_armhf.deb
dpkg -i omxplayer_0.3.7~git20160713~66f9076_armhf.deb
apt-get -f install
dpkg -i omxplayer_0.3.7~git20160713~66f9076_armhf.deb
wget -O /usr/bin/omxplayer-sync https://github.com/turingmachine/omxplayer-sync/raw/master/omxplayer-sync
chmod 0755 /usr/bin/omxplayer-sync
mkdir /media/USB
chmod a+r /media/USB
echo "/dev/sda1	/media/USB	exfat	defaults	0	2" >> /etc/fstab
sed -i -e '$i \setterm -blank 1\n' /etc/rc.local
sed -i -e '$i \sudo /home/pi/playvideos.sh &\n' /etc/rc.local

exit 0

echo "enjoy!" 
