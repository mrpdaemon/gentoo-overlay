mrpdaemon Gentoo overlay
========================

This is my Gentoo overlay containing the following packages:

* Spotify with GNOME integration
* Brother HL-2270DW printer drivers for CUPS
* FUSE-based MTP filesystem for connecting to Android devices (jmtpfs)
* GNOME scripts for automounting encfs volumes (gnome-encfs)
* Meld diff viewer with custom patches

## Installing

This overlay isn't part of layman (yet) so you need to clone the repository
manually and add it to `PORTDIR_OVERLAY` in `/etc/make.conf` as such:

    PORTDIR_OVERLAY="/usr/local/portage /home/user/path/to/mrpdaemon/gentoo-overlay"
