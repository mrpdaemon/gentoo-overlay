mrpdaemon Gentoo overlay
========================

This is my Gentoo overlay containing the following packages:

* Scripts I use for maintaining my Gentoo systems (mrpdaemon-gentoo-scripts)
* Brother HL-2270DW printer drivers for CUPS
* FUSE-based MTP filesystem for connecting to Android devices (jmtpfs)
* GNOME scripts for automounting encfs volumes (gnome-encfs)
* Meld diff viewer with custom patches
* InSync Google Drive sync client
* Turkish language dictionary support for aspell/hunspell
* GTK+ WoL (Wake on LAN) client gwakeonlan
* Broadcom STA drivers for BCM43xx Wifi cards
* fontconfig-infinality with bohoomil's configuration from Arch

## Installing

This overlay isn't officially in layman (yet) so you need to add it to
`/etc/layman/layman.cfg` like so:

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                http://mrpdaemon.github.com/gentoo-overlay/repositories.xml

Run `layman -f` to fetch the overlay list and add it to your installation
using `layman -a mrpdaemon`.
