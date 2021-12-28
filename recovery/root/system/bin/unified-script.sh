#!/system/bin/sh
# This script is needed to automatically set device props.


load_INDIA()
{
    resetprop "ro.product.model" "Mi 11X"
    resetprop "ro.product.odm.model" "Mi 11X"
    resetprop "ro.product.system.model" "Mi 11X"
    resetprop "ro.product.vendor.model" "Mi 11X"
    resetprop "ro.product.name" "aliothin"
    resetprop "ro.build.product" "aliothin"
    resetprop "ro.product.device" "aliothin"
    resetprop "ro.vendor.product.device" "aliothin"

}

load_CN()
{
    resetprop "ro.product.model" "Redmi K40"
    resetprop "ro.product.odm.model" "Redmi K40"
    resetprop "ro.product.system.model" "Redmi K40"
    resetprop "ro.product.vendor.model" "Redmi K40"
    resetprop "ro.product.name" "alioth"
    resetprop "ro.build.product" "alioth"
    resetprop "ro.product.device" "alioth"
    resetprop "ro.vendor.product.device" "alioth"
}

load_global()
{
    resetprop "ro.product.model" "POCO F3"
    resetprop "ro.product.odm.model" "POCO F3"
    resetprop "ro.product.system.model" "POCO F3"
    resetprop "ro.product.vendor.model" "POCO F3"
    resetprop "ro.product.name" "alioth"
    resetprop "ro.build.product" "alioth"
    resetprop "ro.product.device" "alioth"
    resetprop "ro.vendor.product.device" "alioth"

}

project=$(getprop ro.boot.hwc)
echo $project

case $project in
    "INDIA")
        load_INDIA
        ;;
    "CN")
        load_CN
        ;;
    *)
        load_global
        ;;

esac

exit 0

