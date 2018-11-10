# RPi_SyncLooper
Player Multiple Video in sync and loop by OMXPlayer-sync 

  setup:
  git clone or download files
  execute install.sh file in superuser mode
  
  setup all pi in same network:
  
  by router --- you don't need to do additional setup

  by switch --- setup interface eth0 in /boot/dhcpcd.conf
  
  by WIFI, setup your ssid & passwd in /boot/wpa_supplicant.conf
  
  format your USB drive to exfat format(*make sure the video file name has to be same. for exsample: bbb.mov and bbb.mov)
  
  suuport H264 codec in .mp4 .avi .mkv .mov .mpg .m4v and mp3 audio
  
  then "done"
  
  edit /boot/configfile.txt
  
    role=m --master device (can be used as single channel video loop player)
         l --slaver device
    audio_source=hdmi or local or both
    usb=1 --play video from USB media
        0 --play video from /home/pi/
      
        
*Thanks to original sync script from Simon Josi.*

ready to use imgfile: https://drive.google.com/open?id=10wEXzkD2qDfRM4u9-yevPR09CQiCEB8p
