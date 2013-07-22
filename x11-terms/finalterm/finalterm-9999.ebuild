# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

VALA_MIN_API_VERSION="0.14"

inherit git-2 vala cmake-utils gnome2-utils

EGIT_REPO_URI="git://github.com/p-e-w/finalterm"
SRC_URI=""

DESCRIPTION="A modern terminal emulator"
HOMEPAGE="http://finalterm.org"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~x86-fbsd ~x64-freebsd ~x86-freebsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="media-libs/clutter-gtk
	>=media-libs/clutter-1.12
	x11-libs/mx
	dev-libs/keybinder:3
	dev-libs/libgee:0.8
	x11-libs/libnotify
	x11-libs/gtk+:3
"
DEPEND="${RDEPEND}
	$(vala_depend)
	virtual/pkgconfig
	dev-util/intltool
"

src_prepare() {
    vala_src_prepare
    sed -i -e "/NAMES/s:valac:${VALAC}:" cmake/FindVala.cmake || die
    sed -i -e "/GSETTINGS_COMPILE/s:\${GSETTINGS_LOCALINSTALL}:OFF:" cmake/GSettings.cmake || die
}

src_install() {
    cmake-utils_src_install
}

pkg_preinst() {
	gnome2_schemas_savelist
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_schemas_update
	gnome2_icon_cache_update
}
