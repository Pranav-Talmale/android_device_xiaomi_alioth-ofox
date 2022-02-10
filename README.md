# android_device_xiaomi_alioth-ofox
# android_device_xiaomi_alioth
For building OFRP for Xiaomi Mi 11X / Redmi K40 / POCO F3

OrangeFox device tree for Xiaomi Mi 11X / Redmi K40 / POCO F3

The Xiaomi Mi 11X (codenamed _"aliothin"_) and Redmi K40 / POCO F3 (codenamed _"alioth"_) are mid range smartphones from Xiaomi.

## Device specifications

| Device       | Xiaomi Mi 11X / Redmi K40 / POCO F3         |
| -----------: | :------------------------------------------ |
| SoC          | Qualcomm SM8250 Snapdragon 870 5G           |
| CPU          | 8x Qualcomm® Kryo™ 585 up to 2.84GHz        |
| GPU          | Adreno 650                                  |
| Memory       | 8GB / 6GB  (LPDDR 5)                        |
| Shipped Android version | 11                               |
| Storage      | 128GB  (UFS 3.1)                            |
| Battery      | Li-Po 4520 mAh, non-removable               |
| Dimensions   | 163.7 x 76.4 x 7.8 mm                       |
| Display      | 1080 x 2400 (20:9), 6.67 inches             |

## Device picture

![Xiaomi Mi 11X](https://i01.appmifile.com/webfile/globalimg/7/7BFCB70B-C506-E089-8591-9F2A15CA61FE.png)

## Features

**Works**

- Booting.
- **Decryption** (Android 11)
- ADB
- MTP
- OTG
- vA/B partition functions
- Vibration

Mi 11X / Redmi K40 / POCO F3 is using Virtual A/B Partition Scheme!

## Compile

You can find a full compile guide for OrangeFox [Here](https://wiki.orangefox.tech/en/dev/building)

Lunch command :
```
lunch twrp-alioth_eng && mka adbd bootimage
```



## Thanks
- [Original Tree By Nebrassy](https://github.com/TeamWin/android_device_xiaomi_alioth)
