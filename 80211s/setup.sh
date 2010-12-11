#!/bin/bash

RADIOS=5

rmmod mac80211_hwsim
modprobe mac80211_hwsim radios=$RADIOS

for i in $(seq 0 $(($RADIOS - 1)))
do
  iw dev wlan$i interface add mesh$i type mp mesh_id mesh1
#--------------------------------------------------
#  Code in nl80211 that is executed:
#--------------------------------------------------
#   err = rdev->ops->add_virtual_intf(&rdev->wiphy,
#   nla_data(info->attrs[NL80211_ATTR_IFNAME]),
#   type, err ? NULL : &flags, &params);
#-------------------------------------------------- 
  ifconfig mesh$i up
  ifconfig mesh$i 192.168.4.$(($i + 1))
  # arp -i mesh$i -Ds 192.168.4.$(($i + 1)) mesh$i
done

#iw del mesh0 interf
