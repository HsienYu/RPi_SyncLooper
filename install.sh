#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Must be root"
	exit
fi

cp -a startvideos.sh /home/pi/
cp -a configfile.txt /boot/
chmod +x /home/pi/startvideos.sh
apt-get remove omxplayer
rm -rf /usr/bin/omxplayer /usr/bin/omxplayer.bin /usr/lib/omxplayer
apt-get install libpcre3 fonts-freefont-ttf fbset libssh-4 python3-dbus exfat-fuse
wget http://omxplayer.sconde.net/builds/omxplayer_0.3.7~git20160713~66f9076_armhf.deb
apt-get -f inatall
dpkg -i omxplayer_0.3.7~git20160713~66f9076_armhf.deb
wget -O /usr/bin/omxplayer-sync https://github.com/turingmachine/omxplayer-sync/raw/master/omxplayer-sync
chmod 0755 /usr/bin/omxplayer-sync
mkdir /media/USB
chmod a+r /media/USB
echo "/dev/sda1	/media/USB	exfat	defaults,noatime 	0	0" >> /etc/fstab
sed -i -e '$i \setterm -blank 1\n' /etc/rc.local
sed -i -e '$i \sudo /home/pi/startvideos.sh &\n' /etc/rc.local

exit 0

echo "enjoy!" 
