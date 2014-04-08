# Modified to prevent world readable creation of files.
# By default, we want this to get set, even for non-interactive,
# non-login shells.

if [ "`id -g`" = "`id -u`" -a `id -u` -gt 199 ]; then
    umask 007
else
    umask 027
fi
