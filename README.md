mrpdaemon Gentoo overlay
========================

This is my Gentoo overlay containing the following packages:

* Scripts I use for maintaining my Gentoo systems (mrpdaemon-gentoo-scripts)
* Brother HL-2270DW printer drivers for CUPS
* GNOME scripts for automounting encfs volumes (gnome-encfs)
* Meld diff viewer with patch to show deletions as red
* gtksourceview-2 with patch to change default style to mrpdaemon/gtksourceview-theme
* InSync Google Drive sync client
* Turkish language dictionary support for aspell/hunspell
* california - a calendar application for GNOME 3
* gtkparasite - a GTK+ debugging tool
* deluge - a BitTorrent client in python
* simplescreenrecorder - a screen recording application
* gtk+ with custom-cflags USE flag
* gnome-logs - systemd journal viewer for GNOME
* corebird - a GNOME 3 twitter client
* plex-media-server - a media server for home collections

## Installing

This overlay isn't officially in layman (yet) so you need to add it to
`/etc/layman/layman.cfg` like so:

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                http://mrpdaemon.github.com/gentoo-overlay/repositories.xml

Run `layman -f` to fetch the overlay list and add it to your installation
using `layman -a mrpdaemon`.
