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
wget -O- http://yokto.net/0/omxplayer/omxplayer-3176db4.tar.bz2 | tar -C / -xjvf -
ln -sf /lib/arm-linux-gnueabihf/libpcre.so.3 /lib/arm-linux-gnueabihf/libpcre.so.1
wget -O /usr/bin/omxplayer-sync https://github.com/turingmachine/omxplayer-sync/raw/master/omxplayer-sync
chmod 0755 /usr/bin/omxplayer-sync
apt-get update && apt-get install exfat-fuse python-setuptools python-dbus
easy_install pip
pip install pexpect
mkdir /media/USB
chmod a+r /media/USB
echo "/dev/sda1	/media/USB	exfat	defaults,noatime 	0	0" >> /etc/fstab
sed -i -e '$i \setterm -blank 1\n' /etc/rc.local
sed -i -e '$i \sudo /home/pi/startvideos.sh &\n' /etc/rc.local

exit 0

echo "enjoy!" 
