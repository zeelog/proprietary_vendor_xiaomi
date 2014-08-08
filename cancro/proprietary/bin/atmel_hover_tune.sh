#!/system/bin/sh
result=`cat /persist/atmel_hover_tune.status`
case "$result" in
        "1")
        echo "load hover data from flash";;
        *)
        echo 0 > /sys/bus/i2c/devices/2-004b/hover_from_flash;;
        esac

