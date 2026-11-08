#!/bin/bash
# 通过无线 adb 把 Kodama 触摸 IDC 写入设备（首次刷机后执行一次）。
# 用法：先 adb pair / adb connect 连上平板，再运行本脚本。
set -e

ADB="${ADB:-adb}"
DIR="$(cd "$(dirname "$0")" && pwd)"

if ! "$ADB" get-state >/dev/null 2>&1; then
    echo "没有已连接的设备。" >&2
    echo "请先在平板开启开发者选项 -> 无线调试，然后在电脑执行：" >&2
    echo "  adb pair <平板IP>:<配对端口>     # 输入配对码" >&2
    echo "  adb connect <平板IP>:<连接端口>" >&2
    exit 1
fi

"$ADB" root
"$ADB" wait-for-device
"$ADB" shell 'mkdir -p /data/system/devices/idc'
"$ADB" push "$DIR/idc/hid-over-i2c_04F3_2ABE.idc" /data/system/devices/idc/
"$ADB" push "$DIR/idc/hid-over-i2c_04F3_2ABE_Stylus.idc" /data/system/devices/idc/
"$ADB" shell 'chmod 644 /data/system/devices/idc/hid-over-i2c_04F3_2ABE*.idc; chown root:root /data/system/devices/idc/hid-over-i2c_04F3_2ABE*.idc'
"$ADB" reboot

echo "IDC 已写入并重启，触摸方向应恢复为 ORIENTATION_270。"
