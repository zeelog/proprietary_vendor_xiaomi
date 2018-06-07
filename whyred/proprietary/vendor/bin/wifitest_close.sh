#!/vendor/bin/sh
setprop persist.sys.wifiFtmdaemon 0
setprop persist.sys.closewifi_L 0
echo 0 > /sys/module/wlan/parameters/con_mode
ifconfig wlan0 down
exit 0

