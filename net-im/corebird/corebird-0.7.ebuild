# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
# Corebird doesn't work correctly with out of source builds
CMAKE_IN_SOURCE_BUILD=1

inherit eutils cmake-utils gnome2-utils

DESCRIPTION="Native GTK+3 Twitter client"
HOMEPAGE="http://corebird.baedert.org/"
SRC_URI="https://github.com/baedert/corebird/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug glade"

RDEPEND=">=x11-libs/gtk+-3.9
	>=dev-libs/glib-2.38
	net-libs/rest:0.7
	dev-libs/json-glib
	x11-libs/libnotify
	dev-db/sqlite:3
	>=net-libs/libsoup-2.42.3.1
	>=dev-libs/libgee-0.8"
DEPEND="${RDEPEND}
	dev-lang/vala:0.22
	>=dev-util/cmake-2.6"

src_configure() {
	local mycmakeargs=(
		"-DGSETTINGS_COMPILE=no"
		$(cmake-utils_use debug DEBUG)
		$(cmake-utils_use glade CATALOG)
	)
	cmake-utils_src_configure
}

pkg_preinst() {
	gnome2_icon_savelist
	gnome2_schemas_savelist
}

update_caches() {
	gnome2_schemas_update
	gnome2_icon_cache_update
}

pkg_postinst() {
	update_caches
}

pkg_postrm() {
	update_caches
}
