#!/bin/sh
# This does an LDAP lookup and returns the appropriate map to mount things
# under /fs

info=`/usr/bin/ldapsearch -ZZ -x -LLL -b 'ou=automount,dc=tcc,dc=nmt,dc=edu' cn="$1" |grep automountInformation`

if [ -z "${info}" ]; then exit 1; fi

dir=`echo $info | /bin/awk '{print $3}'`;
opts=`echo $info | /bin/awk '{print $2}'`;

echo "$opts $dir"

#if [ "$opts" = "" ] ;then
#    echo -fstype=nfs "$host:$dir"
#else
#    echo -fstype=nfs,"$opts" "$host:$dir"
#fi
