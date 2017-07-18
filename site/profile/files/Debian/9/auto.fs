#!/bin/bash
#
# This does an LDAP lookup and returns the appropriate options to mount
# things under /fs.
#

AUTOBASE="ou=automount,dc=tcc,dc=nmt,dc=edu"

attr=$(ldapsearch -xZZLLL -b $AUTOBASE cn=$1 | grep automountInformation)

if [ -z "${attr}" ]; then exit 1; fi

opts=$(echo $attr | cut -d ' ' -f 2,3)

echo "$opts"
