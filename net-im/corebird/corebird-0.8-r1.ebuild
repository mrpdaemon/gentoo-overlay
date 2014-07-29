# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

VALA_MIN_API_VERSION=0.22

inherit eutils autotools gnome2-utils vala

DESCRIPTION="Native GTK+3 Twitter client"
HOMEPAGE="http://corebird.baedert.org/"
SRC_URI="https://github.com/baedert/corebird/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug glade gstreamer"

RDEPEND="dev-db/sqlite:3
	>=dev-libs/glib-2.40
	dev-libs/json-glib
	>=dev-libs/libgee-0.8
	gstreamer? ( media-libs/gst-plugins-base )
	>=net-libs/libsoup-2.42.3.1
	net-libs/rest:0.7
	>=x11-libs/gtk+-3.12"
DEPEND="${RDEPEND}
	$(vala_depend)
	virtual/pkgconfig"

src_prepare() {
	eautoreconf
	vala_src_prepare
}

src_configure() {
	cb_conf="$(use_enable debug ) \
		$(use_enable glade catalog )"

	if ! use gstreamer ; then
		cb_conf+="
		$(use_enable gstreamer video )"
	fi

	econf ${cb_conf}
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
