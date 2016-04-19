#!/system/etc/Sky/skybox sh
# PROJECT SKYNET (C) 2016 K1ks
# Copyright CYBERDYNE (C) 2016 K1ks
#=======================================================================#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#  You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
#=======================================================================#

export PATH=/system/etc/Sky:$PATH:/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin:

skybox=/system/etc/Sky/skybox

$skybox mount -o remount,rw / 2>/dev/null
$skybox mount -o remount,rw / / 2>/dev/null
$skybox mount -o remount,rw rootfs 2>/dev/null
$skybox mount -o remount,rw /system 2>/dev/null
$skybox mount -o remount,rw /system /system 2>/dev/null

mount -o remount,rw / 2>/dev/null
mount -o remount,rw / / 2>/dev/null
mount -o remount,rw rootfs 2>/dev/null
mount -o remount,rw /system 2>/dev/null
mount -o remount,rw /system /system 2>/dev/null

chmod -f 0755 /system/bin/sysinit
chown -f 0:2000 /system/bin/sysinit
chmod -f 0755 /system/etc/init.d
chmod -f 0755 /system/etc/init.d/*
chown -f 0:0 /system/etc/init.d
chown -f 0:0 /system/etc/init.d/*
chmod -f 0755 /system/etc/Sky/*
chown -f 0:0 /system/etc/Sky/*

/system/bin/sysinit