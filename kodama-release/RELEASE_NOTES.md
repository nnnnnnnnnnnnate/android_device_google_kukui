# Kodama sku16 LineageOS 23.2 (2026-11-08)

LineageOS 23.2 (Android 16) USB installer image for Google Kodama sku16.

## Download

- `lineage-23.2-kukui-20261108.zip` (about 1.1 GB)
- SHA-256: `9012d0919f8360470c09503c132ed5352c3ffe79f95bd12b7d656ec248dca6ce`

The 11.8 GB raw image is inside the zip. It is not uploaded separately.

## What changed

- Image captured from a working Kodama USB stick.
- The kernel / `pmOS_boot` payloads are from that stick.
- The USB userdata was cleaned; only the Kodama touch IDC
  (`04F3:2ABE`, `ORIENTATION_270`) is kept.
- `super` is unchanged from the previous build.

## Install

Write the zip to a 16 GiB or larger USB stick with Rufus or BalenaEtcher
(DD mode). Boot the tablet with Ctrl+U, then use **Install to eMMC** and
choose **Android only**.

The installer formats eMMC userdata, so after installing to eMMC run
`fix-touch.sh` once to write the Kodama IDC. Touch is already correct
when booting from the USB stick.

See `刷机指南.md` in this repository for the full guide.

## Checksums and touch fix

- `SHA256SUMS.txt`
- `fix-touch.sh`
- `idc/hid-over-i2c_04F3_2ABE.idc`
- `idc/hid-over-i2c_04F3_2ABE_Stylus.idc`

## Known limitations

- Camera is not supported: the system reports 0 camera devices.
- No RTC; wait for network time sync after boot.
- Wired USB adb/MTP is not available; use wireless adb.
- SELinux is permissive.
- Tested on kodama-sku16 only.
