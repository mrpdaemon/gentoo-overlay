# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

VALA_MIN_API_VERSION="0.22"
VALA_MAX_API_VERSION="0.24"

inherit eutils gnome2 vala versionator

MY_PV=$(get_version_component_range 1-2)
DESCRIPTION="Calendar application for GNOME 3"
HOMEPAGE="http://wiki.gnome.org/Apps/California"
SRC_URI="mirror://gnome/sources/${PN}/$(get_version_component_range 1-2)/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="
	>=dev-libs/glib-2.38.0:2
	>=dev-libs/gobject-introspection-1.38.0
	>=dev-libs/libgdata-0.14.0:0/13
	>=dev-libs/libgee-0.10.5:0.8
	>=net-libs/gnome-online-accounts-3.8.3:0/1
	>=net-libs/libsoup-2.44.0:2.4
	>=x11-libs/gtk+-3.10.7:3"
DEPEND="${RDEPEND}
	$(vala_depend)
	>=dev-util/intltool-0.35.0"

DOCS=( AUTHORS NEWS README THANKS )

src_compile() {
	local valaver="$(vala_best_api_version)"
	emake VALAC="$(type -p valac-${valaver})"
}

src_install() {
	gnome2_src_install
}
