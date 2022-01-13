# TWRP Tree for Samsung Galaxy A52 4G

### How to build
This was tested and it's fully compatible with [minimal manifest twrp](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp).
1. Set up the build environment following instructions from [here](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp/blob/twrp-11/README.md#getting-started)
2. Clone device tree:
```bash
git clone -b android-11.0 https://github.com/Simon1511/twrp_device_samsung_a52q.git device/samsung/a52q
```
3. To build:
```bash
export ALLOW_MISSING_DEPENDENCIES=true && . build/envsetup.sh && lunch twrp_a52q-eng && mka recoveryimage
```

### Credits
* DarthJabba9
* travarilo
* hendramanu

### Links
* [Kernel source](https://github.com/Samsung-SM7215/android_kernel_samsung_sm7125)
