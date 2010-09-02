#!/bin/bash

RADIOS=5

rmmod mac80211_hwsim
modprobe mac80211_hwsim radios=$RADIOS

for i in $(seq 0 $(($RADIOS - 1)))
do
  iw dev wlan$i interface add mesh$i type mp mesh_id mesh1
  ifconfig mesh$i up
  ifconfig mesh$i 192.168.4.$(($i + 1))
  # arp -i mesh$i -Ds 192.168.4.$(($i + 1)) mesh$i
done

