#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Must be root"
	exit
fi

cp -a playvideos.sh /home/pi/playvideos.sh
cp -a configfile.txt /boot/configfile.txt
cp -a ssh /boot/ssh
cp -a wpa_supplicant.conf /boot/wpa_supplicant.conf
cp /etc/dhcpcd.conf /boot/dhcpcd.conf
mv /etc/dhcpcd.conf /etc/dhcpcd.conf.backup
ln -s /boot/dhcpcd.conf /etc/dhcpcd.conf
chmod +x /home/pi/playvideos.sh
apt-get remove omxplayer
rm -rf /usr/bin/omxplayer /usr/bin/omxplayer.bin /usr/lib/omxplayer
apt-get install libpcre3 fonts-freefont-ttf fbset libssh-4 python3-dbus exfat-fuse exfat-utils
wget https://archive.raspberrypi.org/debian/pool/main/o/omxplayer/omxplayer_0.3.7~git20160923~dfea8c9_armhf.deb
dpkg -i omxplayer_0.3.7~git20160923~dfea8c9_armhf.deb
apt-get -f install
dpkg -i omxplayer_0.3.7~git20160923~dfea8c9_armhf.deb
apr-get update
apt-get -f install
wget -O /usr/bin/omxplayer-sync https://github.com/HsienYu/omxplayer-sync/raw/master/omxplayer-sync
chmod 0755 /usr/bin/omxplayer-sync
mkdir /media/USB
chmod a+r /media/USB
echo "/dev/sda1	/media/USB	exfat	defaults	0	2" >> /etc/fstab
sed -i -e '$i \setterm -blank 1\n' /etc/rc.local
sed -i -e '$i \sudo /home/pi/playvideos.sh &\n' /etc/rc.local

exit 0

echo "enjoy!" 
