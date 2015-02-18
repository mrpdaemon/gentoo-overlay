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
* gtkparasite - a GTK+ debugging tool
* simplescreenrecorder - a screen recording application
* corebird - a GNOME 3 twitter client
* plex-media-server - a media server for home collections
* geary - GTK+3 mail client
* california -a GTK+3 calendar application

## Installing

This overlay isn't officially in layman (yet) so you need to add it to
`/etc/layman/layman.cfg` like so:

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                http://mrpdaemon.github.com/gentoo-overlay/repositories.xml

Run `layman -f` to fetch the overlay list and add it to your installation
using `layman -a mrpdaemon`.
