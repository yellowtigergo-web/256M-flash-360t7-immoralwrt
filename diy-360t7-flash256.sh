#!/bin/bash
set -eux

cd openwrt

echo "=== [flash256] Find 360t7 DTS/DTSI ==="
grep -RIn --include="*.dts" --include="*.dtsi" "360t7\|360 t7\|qihoo" target/linux/mediatek || true
grep -RIn --include="*.dts" --include="*.dtsi" "qihoo_360t7" target/linux/mediatek || true

echo "=== [flash256] Partition related lines (top 200) ==="
grep -RIn --include="*.dts" --include="*.dtsi" \
  "fixed-partitions\|partition@\|reg = <0x\|nmbm\|ubi" \
  target/linux/mediatek | head -n 200 || true

echo "=== [flash256] Done ==="
