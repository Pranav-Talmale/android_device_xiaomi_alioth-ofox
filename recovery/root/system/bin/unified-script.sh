#!/system/bin/sh
# set a couple of props, depending on device


load_INDIA()
{
    resetprop "ro.product.model" "Mi 11X"
    resetprop "ro.product.odm.model" "Mi 11X"
    resetprop "ro.product.system.model" "Mi 11X"
    resetprop "ro.product.vendor.model" "Mi 11X"
    resetprop "ro.product.system_ext.model" "Mi 11X"
    resetprop "ro.product.product.model" "Mi 11X"
    resetprop "ro.product.brand" "Xiaomi"
    resetprop "ro.product.odm.brand" "Xiaomi"
    resetprop "ro.product.system.brand" "Xiaomi"
    resetprop "ro.product.system_ext.brand" "Xiaomi"
    resetprop "ro.product.product.brand" "Xiaomi"
    resetprop "ro.product.vendor.brand" "Xiaomi"
    resetprop "ro.product.system.name" "fox_aliothin"
    resetprop "ro.product.vendor.name" "fox_aliothin"
    resetprop "ro.product.system_ext.name" "fox_aliothin"
    resetprop "ro.product.odm.name" "fox_aliothin"
    resetprop "ro.product.product.name" "fox_aliothin"
    resetprop "ro.product.name" "aliothin"
    resetprop "ro.build.product" "aliothin"
    resetprop "ro.product.device" "aliothin"
    resetprop "ro.vendor.product.device" "aliothin"
    resetprop "ro.system.product.device" "aliothin"
    resetprop "ro.system_ext.product.device" "aliothin"
    resetprop "ro.odm.product.device" "aliothin"
    resetprop "ro.product.product.device" "aliothin"

}

load_CN()
{
    resetprop "ro.product.model" "Redmi K40"
    resetprop "ro.product.odm.model" "Redmi K40"
    resetprop "ro.product.system.model" "Redmi K40"
    resetprop "ro.product.vendor.model" "Redmi K40"
    resetprop "ro.product.system_ext.model" "Redmi K40"
    resetprop "ro.product.product.model" "Redmi K40"
    resetprop "ro.product.brand" "Xiaomi"
    resetprop "ro.product.odm.brand" "Xiaomi"
    resetprop "ro.product.system.brand" "Xiaomi"
    resetprop "ro.product.system_ext.brand" "Xiaomi"
    resetprop "ro.product.product.brand" "Xiaomi"
    resetprop "ro.product.vendor.brand" "Xiaomi"
    
}

load_global()
{
    resetprop "ro.product.model" "POCO F3"
    resetprop "ro.product.odm.model" "POCO F3"
    resetprop "ro.product.system.model" "POCO F3"
    resetprop "ro.product.vendor.model" "POCO F3"
    resetprop "ro.product.system_ext.model" "POCO F3"
    resetprop "ro.product.product.model" "POCO F3"
    resetprop "ro.product.brand" "POCO"
    resetprop "ro.product.odm.brand" "POCO"
    resetprop "ro.product.system.brand" "POCO"
    resetprop "ro.product.system_ext.brand" "POCO"
    resetprop "ro.product.product.brand" "POCO"
    resetprop "ro.product.vendor.brand" "POCO"


}

variant=$(getprop ro.boot.hwc)
echo $variant

case $variant in
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

