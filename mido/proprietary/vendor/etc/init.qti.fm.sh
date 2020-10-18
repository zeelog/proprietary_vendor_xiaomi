#!/vendor/bin/sh
# Copyright (c) 2019 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.
#
# Copyright (c) 2009-2011, 2015, 2017 The Linux Foundation. All rights reserved.
#

setprop vendor.hw.fm.init 0

mode=`getprop vendor.hw.fm.mode`
version=199217

LOG_TAG="qti-fm"
LOG_NAME="${0}:"

loge ()
{
  /vendor/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
  /vendor/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

failed ()
{
  loge "$1: exit code $2"
  exit $2
}

logi "In FM shell Script"
logi "mode: $mode"
logi "Version : $version"

#$fm_qsoc_patches <fm_chipVersion> <enable/disable WCM>
#
case $mode in
  "normal")
        logi "inserting the radio transport module"
        echo 1 > /sys/module/radio_iris_transport/parameters/fmsmd_set
        /vendor/bin/fm_qsoc_patches $version 0
     ;;
  "wa_enable")
   /vendor/bin/fm_qsoc_patches $version 1
     ;;
  "wa_disable")
   /vendor/bin/fm_qsoc_patches $version 2
     ;;
   *)
    logi "Shell: Default case"
    /vendor/bin/fm_qsoc_patches $version 0
    ;;
esac

exit_code_fm_qsoc_patches=$?

case $exit_code_fm_qsoc_patches in
   0)
    logi "FM QSoC calibration and firmware download succeeded"
   ;;
  *)
    failed "FM QSoC firmware download and/or calibration failed" $exit_code_fm_qsoc_patches
   ;;
esac

setprop vendor.hw.fm.init 1

exit 0
