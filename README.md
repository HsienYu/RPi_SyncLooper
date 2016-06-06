# RPi_SyncLooper
Player Multiple Video in sync and loop by OMXPlayer-sync 

  setup:
  copy or download files
  execute install.sh file
  
  setup all pi in same network
  
  format your USB media to exfat format
  
  then "done"
  
  configfile:
  
    role=m --master device (can be used as single channel video loop player)
         s --slaver device
    audio_source=hdmi or local
    usb=1 --play video from USB media
        0 --play video from /home/pi/
        
        
*Tahnks to StevenHickson & turingmachine, and original sync script from Simon Josi.*
