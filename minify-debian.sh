#!/bin/bash

# Run inside Debian rootfs.
# Clears documentation and caches.
# Maintains a cleared state after new package installs.
#
# See https://askubuntu.com/questions/129566/remove-documentation-to-save-hard-drive-space/401144
# and https://wiki.ubuntu.com/ReducingDiskFootprint#Documentation

find usr/share/doc -depth -type f ! -name copyright -print0 | xargs -0 -r rm || true
find usr/share/doc -empty -type d -print0 | xargs -0 -r rmdir || true 
rm -rf usr/share/groff/* usr/share/info/*
rm -rf usr/share/lintian/* usr/share/linda/* var/cache/man/*
rm -rf usr/share/man/*
rm -rf usr/share/locale/*
find var/cache/apt -type f -print0 | xargs -0 -r rm || true
find var/lib/apt -type f -print0 | xargs -0 -r rm || true

cat <<EOT >> etc/apt/apt.conf.d/02nocache
Dir::Cache {
  srcpkgcache "";
  pkgcache "";
}
EOT

cat <<EOT >> etc/apt/apt.conf.d/02compress-indexes
Acquire::GzipIndexes "true";
Acquire::CompressionTypes::Order:: "gz";
EOT

cat <<EOT >> etc/dpkg/dpkg.cfg.d/01_nodoc
path-exclude /usr/share/doc/*
# we need to keep copyright files for legal reasons
path-include /usr/share/doc/*/copyright
path-exclude /usr/share/man/*
path-exclude /usr/share/groff/*
path-exclude /usr/share/info/*
path-exclude /usr/share/lintian/*
path-exclude /usr/share/linda/*
EOT
