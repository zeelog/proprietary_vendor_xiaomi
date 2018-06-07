#!/vendor/bin/sh
#rmmod wlan
#sleep 2
#insmod /system/lib/modules/wlan.ko
#sleep 3
echo 5 > /sys/module/wlan/parameters/con_mode
setprop persist.sys.wifiFtmdaemon 1
setprop persist.sys.openwifi_L 0
ifconfig wlan0 up
exit 0

