#!/system/bin/sh

# Now there may be two different sensor HAL, set ro.hardware.sensors to
# specific value for the hw_get_module to load the right *.so
	chown -h system:system /persist/PSensorThFar.txt
	chmod -h 600 /persist/PSensorThFar.txt
if [ -r /sys/bus/i2c/devices/0-0008/iio:device*/name ]; then
	sensor_module=$(cat /sys/bus/i2c/devices/0-0008/iio:device*/name)
elif [ -r /sys/bus/i2c/devices/0-0068/iio:device*/name ]; then
	sensor_module=$(cat /sys/bus/i2c/devices/0-0068/iio:device*/name)
fi

if [ -e /dev/akm09911_dev ]; then
	start akmd
	/system/bin/log -p e -t "SensorSelect" "Compass on AP, try to start akmd"
else
	/system/bin/log -p e -t "SensorSelect" "No Compass on AP, not to start akmd"
fi

if [ -z $sensor_module ]; then
	/system/bin/log -p e -t "SensorSelect" "Detect Sensor failed, use default HAL"
	setprop ro.hardware.sensors lsm6db0
else
	setprop ro.hardware.sensors $sensor_module
	/system/bin/log -p d -t "SensorSelect" "Select Sensor HAL $sensor_module"
fi
