# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="GNOME integration for Spotify"
HOMEPAGE="https://github.com/mrpdaemon/gnome-integration-spotify"

SRC_URI="http://github.com/mrpdaemon/${PN}/tarball/${PV} -> ${PN}-git-${PV}.tgz"
S="${WORKDIR}/mrpdaemon-${PN}-05326a8"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-lang/python
		dev-python/dbus-python
		media-gfx/imagemagick
		x11-misc/wmctrl
		x11-misc/xautomation
		x11-misc/xdotool
		x11-apps/xwininfo"

src_install() {
	dobin spotify-dbus.py
}
