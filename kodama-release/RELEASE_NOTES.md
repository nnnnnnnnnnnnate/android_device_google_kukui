# Kodama sku16 LineageOS 23.2

LineageOS 23.2 (Android 16) USB installer image for Google Kodama sku16.

## Download

- `lineage-23.2-kukui-20261105.zip` (about 1.1 GB)
- SHA-256: `d95aac1a88439325667ea047e4512c231b709a5acbe3ffab9e368e09a8598ce9`

The 11.8 GB raw image is inside the zip. It is not uploaded separately.

## Install

Write the zip to a 16 GiB or larger USB stick with Rufus or BalenaEtcher
(DD mode). Boot the tablet with Ctrl+U, then use **Install to eMMC** and
choose **Android only**.

See `刷机指南.md` in this repository for the full guide and the
post-install touch fix.

## Checksums and touch fix

- `kodama-release/SHA256SUMS.txt`
- `kodama-release/fix-touch.sh`
- `kodama-release/idc/`

## Known limitations

- Camera is not supported: the system reports 0 camera devices.
- No RTC; wait for network time sync after boot.
- Wired USB adb/MTP is not available; use wireless adb.
- SELinux is permissive.
- Tested on kodama-sku16 only.
