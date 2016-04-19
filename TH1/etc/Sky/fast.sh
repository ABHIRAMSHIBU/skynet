#!/system/etc/Sky/skybox sh
# PROJECT SKYNET 
# Copyright CYBERDYNE (C) 2016 K1ks MoD Abhiram Shibu
###########################################################################################################################
## ______   _____          _________  ____   ______                                 _____    ______
##/      \ |     | |     |     |      |   \ /      \ |\        /|    |\        /|  |     |  |      \
##|      | |     | |     |     |      |   / |      | | \      / |    | \      / |  |     |  |       \
##|------| |-----  |-----|     |      |__/  |------| |  \    /  |    |  \    /  |  |     |  |       |
##|      | |     | |     |     |      |  \  |      | |   \  /   |    |   \  /   |  |     |  |       /
##|      | |_____| |     | ____|____  |   \ |      | |    \/    |    |    \/    |  |_____|  |______/
##
##########################################################################################################################
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

PMB=/system/etc/Sky/INSTALL.log
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

if [ -e $PMB ]; then
$skybox rm $PMB;
fi;

$skybox touch $PMB;
$skybox echo "# STARTING UP OF SKYNET CONTROL CENTER : $( date +"%m-%d-%Y %H:%M:%S" )" | $skybox tee -a $PMB;
$skybox echo "" | $skybox tee -a $PMB;
$skybox echo "# PROJECT_SKYNET_GENISYS" | $skybox tee -a $PMB;
$skybox echo "" | $skybox tee -a $PMB;

### SU.D Check

 if [ ! -d /system/su.d ]; then
 $skybox mkdir -p /system/su.d/
 $skybox chmod 755 /system/su.d/
 $skybox echo "=====* SU.D FOUND..." | $skybox tee -a $PMB
 else
 $skybox echo "=====* SU.D NOT FOUND = CREATED..." | $skybox tee -a $PMB
 fi;

### INIT.D Activator

if [ -e /system/app/SuperSU.apk ]; then
$skybox rm -f /system/su.d/INIT.sh
$skybox cp -f /system/etc/Sky/INIT.sh /system/su.d/INIT.sh
$skybox chmod 0755 /system/su.d/INIT.sh
$skybox chown 0:2000 /system/su.d/INIT.sh
$skybox echo "=====* INIT.D SUPPORT WITH SU.D = ACTIVATED..." | $skybox tee -a $PMB
elif [ -e /system/app/SuperSU/SuperSU.apk ]; then
$skybox rm -f /system/su.d/INIT.sh
$skybox cp -f /system/etc/Sky/INIT.sh /system/su.d/INIT.sh
$skybox chmod 0755 /system/su.d/INIT.sh
$skybox chown 0:2000 /system/su.d/INIT.sh
$skybox echo "=====* INIT.D SUPPORT WITH SU.D = ACTIVATED..." | $skybox tee -a $PMB
elif [ -e /data/su.img ]; then
$skybox rm -f /system/su.d/INIT.sh
$skybox cp -f /system/etc/Sky/INIT.sh /system/su.d/INIT.sh
$skybox chmod 0755 /system/su.d/INIT.sh
$skybox chown 0:2000 /system/su.d/INIT.sh
$skybox echo "=====* INIT.D SUPPORT WITH SU.D = ACTIVATED..." | $skybox tee -a $PMB
elif [ -e /data/app/eu.chainfire.supersu-* ]; then
$skybox rm -f /system/su.d/INIT.sh
$skybox cp -f /system/etc/Sky/INIT.sh /system/su.d/INIT.sh
$skybox chmod 0755 /system/su.d/INIT.sh
$skybox chown 0:2000 /system/su.d/INIT.sh
$skybox echo "=====* INIT.D SUPPORT WITH SU.D = ACTIVATED..." | $skybox tee -a $PMB
else
$skybox rm -f /system/etc/install-recovery-2.sh
$skybox cp -f /system/etc/Sky/INIT.sh /system/etc/install-recovery-2.sh
$skybox chmod 0755 /system/etc/install-recovery-2.sh
$skybox chown 0:2000 /system/etc/install-recovery-2.sh
$skybox echo "=====* INIT.D SUPPORT WITH INSTALL2 = ACTIVATED..." | $skybox tee -a $PMB
fi;

$skybox echo "=====* INITIALIZING SKYNET , WAIT..." | $skybox tee -a $PMB

$skybox run-parts /system/etc/init.d/ >/dev/null 2>&1

$skybox echo "=====* MEMORY BOOSTER..." | $skybox tee -a $PMB

$skybox sync;
$skybox echo "3" > /proc/sys/vm/drop_caches;

cache=/proc/sys/vm/drop_caches
drop=`$skybox cat $cache`
if [ "$drop" -gt 1 ]; then
$skybox echo "1" > /proc/sys/vm/drop_caches;
fi;

$skybox echo "=====* SYSTEM OPTIMIZED..." | $skybox tee -a $PMB

$skybox chmod 0644 $PMB

exit 0
