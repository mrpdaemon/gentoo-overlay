mrpdaemon Gentoo overlay
========================

This is my Gentoo overlay containing the following packages:

* Spotify with GNOME integration
* Brother HL-2270DW printer drivers for CUPS
* FUSE-based MTP filesystem for connecting to Android devices (jmtpfs)
* GNOME scripts for automounting encfs volumes (gnome-encfs)
* Meld diff viewer with custom patches

## Installing

This overlay isn't officially in layman (yet) so you need to add it to
`/etc/layman/layman.cfg` like so:

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                http://http://mrpdaemon.github.com/gentoo-overlay/repositories.xml

Run `layman -f` to fetch the overlay list and add it to your installation
using `layman -a mrpdaemon`.
