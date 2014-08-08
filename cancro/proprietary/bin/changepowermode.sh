#!/system/bin/sh

target=`getprop ro.product.real_model`
powermode=`getprop persist.sys.aries.power_profile`
dev_governor=`ls /sys/class/devfreq/qcom,cpubw*/governor`
case "$target" in
    "MI 3W" | "MI 3C")
        case "$powermode" in
            "high")
                 echo 2265600                              > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
                 echo 2265600                              > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
                 echo 2265600                              > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
                 echo 2265600                              > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
                 echo 20000                                > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                 echo 60                                   > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                 echo 1190400                              > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                 echo 70                                   > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                 echo 40000                                > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                 echo 20                                   > /sys/module/cpu_boost/parameters/boost_ms
                 echo 1728000                              > /sys/module/cpu_boost/parameters/sync_threshold
                 echo 1497600                              > /sys/module/cpu_boost/parameters/input_boost_freq
                 echo 40                                   > /sys/module/cpu_boost/parameters/input_boost_ms
                 echo 255                                  > /sys/class/leds/lcd-backlight/max_brightness
                 echo 578000000                            > /sys/class/kgsl/kgsl-3d0/max_gpuclk
                 echo "msm_cpufreq"                        > $dev_governor
              ;;
            "middle")
                 echo 2265600                              > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
                 echo 2265600                              > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
                 echo 2265600                              > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
                 echo 2265600                              > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
                 echo "20000 1400000:40000 1700000:20000"  > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                 echo 90                                   > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                 echo 1190400                              > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                 echo "85 1500000:90 1800000:70"           > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                 echo 40000                                > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                 echo 20                                   > /sys/module/cpu_boost/parameters/boost_ms
                 echo 1728000                              > /sys/module/cpu_boost/parameters/sync_threshold
                 echo 1190400                              > /sys/module/cpu_boost/parameters/input_boost_freq
                 echo 40                                   > /sys/module/cpu_boost/parameters/input_boost_ms
                 echo 255                                  > /sys/class/leds/lcd-backlight/max_brightness
                 echo 578000000                            > /sys/class/kgsl/kgsl-3d0/max_gpuclk
                 echo "cpubw_hwmon"                        > $dev_governor
             ;;
             "low")
                 echo 1036800                              > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
                 echo 1036800                              > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
                 echo 1036800                              > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
                 echo 1036800                              > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
                 echo "40000"                              > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                 echo 90                                   > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                 echo 960000                               > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                 echo "85 960000:70"                       > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                 echo 40000                                > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                 echo 0                                    > /sys/module/cpu_boost/parameters/boost_ms
                 echo 960000                               > /sys/module/cpu_boost/parameters/sync_threshold
                 echo 960000                               > /sys/module/cpu_boost/parameters/input_boost_freq
                 echo 40                                   > /sys/module/cpu_boost/parameters/input_boost_ms
                 echo 100                                  > /sys/class/leds/lcd-backlight/max_brightness
                 echo 330000000                            > /sys/class/kgsl/kgsl-3d0/max_gpuclk
                 echo "cpubw_hwmon"                        > $dev_governor
              ;;
        esac
        ;;

    "LEO "* | "MI 4"*)
        case "$powermode" in
            "high")
                 stop mpdecision
                 sleep 1
                 echo 1                                    > /sys/devices/system/cpu/cpu1/online
                 echo 1                                    > /sys/devices/system/cpu/cpu2/online
                 echo 1                                    > /sys/devices/system/cpu/cpu3/online
                 echo 1                                    > /sys/devices/system/cpu/cpu1/online
                 echo 1                                    > /sys/devices/system/cpu/cpu2/online
                 echo 1                                    > /sys/devices/system/cpu/cpu3/online
                 echo 2457600                              > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
                 echo 2457600                              > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
                 echo 2457600                              > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
                 echo 2457600                              > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
                 echo performance                          > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
                 echo performance                          > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
                 echo performance                          > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
                 echo performance                          > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
                 echo 20                                   > /sys/module/cpu_boost/parameters/boost_ms
                 echo 1728000                              > /sys/module/cpu_boost/parameters/sync_threshold
                 echo 1497600                              > /sys/module/cpu_boost/parameters/input_boost_freq
                 echo 40                                   > /sys/module/cpu_boost/parameters/input_boost_ms
                 echo 255                                  > /sys/class/leds/lcd-backlight/max_brightness
                 echo 578000000                            > /sys/class/kgsl/kgsl-3d0/max_gpuclk
                 echo performance                          > /sys/class/kgsl/kgsl-3d0/devfreq/governor
                 echo "msm_cpufreq"                        > $dev_governor
              ;;
            "middle")
                 echo interactive                          > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
                 echo interactive                          > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
                 echo interactive                          > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
                 echo interactive                          > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
                 echo 2457600                              > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
                 echo 2457600                              > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
                 echo 2457600                              > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
                 echo 2457600                              > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
                 echo "20000 1400000:40000 1700000:20000"  > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                 echo 90                                   > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                 echo 1190400                              > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                 echo "85 1500000:99"                      > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                 echo 40000                                > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                 echo 20                                   > /sys/module/cpu_boost/parameters/boost_ms
                 echo 1497600                              > /sys/module/cpu_boost/parameters/sync_threshold
                 echo 1190400                              > /sys/module/cpu_boost/parameters/input_boost_freq
                 echo 40                                   > /sys/module/cpu_boost/parameters/input_boost_ms
                 echo 255                                  > /sys/class/leds/lcd-backlight/max_brightness
                 echo 578000000                            > /sys/class/kgsl/kgsl-3d0/max_gpuclk
                 echo msm-adreno-tz                        > /sys/class/kgsl/kgsl-3d0/devfreq/governor
                 echo "cpubw_hwmon"                        > $dev_governor
                 start mpdecision
             ;;
        esac
        ;;
esac
