#!/bin/bash -e

# Remove APT cache files
rm -fr "${ROOTFS_DIR}/var/cache/apt/pkgcache.bin"
rm -fr "${ROOTFS_DIR}/var/cache/apt/srcpkgcache.bin"

# Remove all doc files

find "${ROOTFS_DIR}/usr/share/doc" -depth -type f ! -name copyright -print0 | xargs -0 rm || true
find "${ROOTFS_DIR}/usr/share/doc" -empty -print0 | xargs -0 rmdir || true

# Remove all man pages and info files
rm -rf "${ROOTFS_DIR}/usr/share/man" "${ROOTFS_DIR}/usr/share/groff" "${ROOTFS_DIR}/usr/share/info" "${ROOTFS_DIR}/usr/share/lintian" "${ROOTFS_DIR}/usr/share/linda" "${ROOTFS_DIR}/var/cache/man"
