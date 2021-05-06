#!/usr/bin/env bash

if find /etc/systemd/system/itsm.service -name itsm.service -print -quit|
    grep -q '^';then
    systemctl stop itsm && systemctl stop cmdavd && systemctl disable itsm && systemctl disable cmdavd && rm -f /etc/systemd/system/itsm.service && rm -rf /opt/COMODO && rm -rf /run/comodo && rm -rf /etc/xdg/menus/applications-merged/comodo-comodo.menu && rm -rf ~/Desktop/comodo-ccs.desktop
    echo ""
    echo "***COMODO CLIENT COMMUNICATION IS UNINSTALLED***"
    echo ""
    read -p "REBOOT IS NEEDED, PERFORM NOW? Y/N " -n 1 -r
    echo    
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        /sbin/reboot
    fi
elif find /etc/init/itsm.conf -name itsm.conf-print -quit|
    grep -q '^';then
    stop itsm && rm /etc/init/itsm.conf && initctl reload-configuration && rm -rf /opt/COMODO && rm -rf /run/comodo && rm -rf /etc/xdg/menus/applications-merged/comodo-comodo.menu && rm -rf ~/Desktop/comodo-ccs.desktop
    echo ""
    echo "***COMODO CLIENT COMMUNICATION IS UNINSTALLED***"
    echo ""
    read -p "REBOOT IS NEEDED, PERFORM NOW? Y/N " -n 1 -r
    echo    
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        /sbin/reboot
    fi    
else
    echo ""
    echo "*** GOOD NEWS!  This machine iS NOT ENROLLED IN ITSM,  The Machine might show up in the endpoint but it can't log what you are doing***"
    echo ""
fi
