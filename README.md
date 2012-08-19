mrpdaemon Gentoo overlay
========================

This is my Gentoo overlay containing the following packages:

* Spotify with GNOME integration

## Installing

This overlay isn't part of layman (yet) so you need to clone the repository
manually and add it to `PORTDIR_OVERLAY` in `/etc/make.conf` as such:

    PORTDIR_OVERLAY="/usr/local/portage /home/user/path/to/mrpdaemon/gentoo-overlay"
