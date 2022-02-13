#!/sbin/sh

sleep 5

# Unmount
umount /system_root
umount /vendor

# Mount system and vendor once to fix permissions
mount /dev/block/dm-0 /system_root
mount /dev/block/dm-1 /vendor

# Remount as read-write
mount -o remount,rw /system_root
mount -o remount,rw /vendor

# Unmount
umount /system_root
umount /vendor

exit 0
