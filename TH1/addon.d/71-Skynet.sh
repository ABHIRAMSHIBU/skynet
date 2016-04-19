#!/system/bin/sh
# PROJECT SKYNET 
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

. /tmp/backuptool.functions

list_files() {
cat <<EOF

bin/adn
bin/menu
bin/mode
bin/boost
bin/no_mod
bin/oom
bin/profil
bin/scan
bin/sky
bin/out
bin/sysinit

etc/install-recovery.sh
etc/install-recovery-2.sh

etc/Sky/*

etc/cron.d/*

etc/init.d/*
etc/init.d.bak
etc/init.d.sky

etc/hosts
etc/hosts.bak

lib/egl/egl.cfg
lib/egl/libGLES_android.so
lib/egl/egl.cfg.bak
lib/egl/libGLES_android.so.bak
lib/egl/egl.cfg.bak

system/su.d/*
system/etc/passwd
system/etc/group
system/etc/shadow 
system/usr/idc/mxt224_ts_input.idc

system/app/Skynet.apk
system/app/Skynet/Skynet.apk

/data/.supersu

EOF
}

case "$1" in

backup)
list_files | while read FILE DUMMY; do
backup_file $S/$FILE

done

;;
restore)

list_files | while read FILE REPLACEMENT; do
R=""
[ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
[ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R

done

;;
pre-backup)

;;
post-backup)

;;
pre-restore)

;;
post-restore)

chmod 0755 bin/adn
chown 0:0 bin/adn 

chmod 0755 bin/menu
chown 0:0 bin/menu

chmod 0755 bin/mode
chown 0:0 bin/mode

chmod 0755 bin/boost
chown 0:0 bin/boost

chmod 0755 bin/no_mod
chown 0:0 bin/no_mod

chmod 0755 bin/oom
chown 0:0 bin/oom

chmod 0755 bin/profil
chown 0:0 bin/profil

chmod 0755 bin/scan
chown 0:0 bin/scan

chmod 0755 bin/sky
chown 0:0 bin/sky

chmod 0755 bin/out
chown 0:0 bin/out

chmod 0755 bin/sysinit
chown 0:2000 bin/sysinit

chmod 0755 etc/install-recovery.sh
chown 0:0 etc/install-recovery.sh

chmod 0755 etc/install-recovery-2.sh
chown 0:0 etc/install-recovery-2.sh

chmod -R 755 /system/etc/Sky
chown -R 0:0 /system/etc/Sky

chmod -R 755 /system/etc/cron.d
chown -R 0:0 /system/etc/cron.d

chmod -R 755 /system/etc/init.d
chown -R 0:0 /system/etc/init.d

chmod 0000 etc/init.d.bak

chmod 0000 etc/init.d.bak

chmod 0644 etc/hosts

chmod 0000 etc/hosts.bak

chmod 0755 lib/egl/egl.cfg
chmod 0755 lib/egl/libGLES_android.so
chmod 0755 lib/egl/egl.cfg.bak
chmod 0755 lib/egl/libGLES_android.so.bak
chmod 0755 lib/egl/egl.cfg.bak

chmod 0755 /system/su.d/
chown -f 0:0 /system/su.d/

chmod 0755 system/etc/passwd
chmod 0755 system/etc/group
chmod 0755 system/etc/shadow 

chmod 0755 system/usr/idc/mxt224_ts_input.idc
chown 0:0 system/usr/idc/mxt224_ts_input.idc

chmod 0644 system/app/Skynet.apk
chmod 0644 system/app/Skynet/Skynet.apk

chmod 0755 /data/.supersu
chown 0:2000 /data/.supersu

;;

esac
