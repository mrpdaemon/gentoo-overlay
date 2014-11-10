# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit gnome2 distutils-r1

DESCRIPTION="GTK+ utility to awake machines using the Wake on LAN"
HOMEPAGE="http://www.muflone.com/gwakeonlan/"
SRC_URI="https://github.com/muflone/gwakeonlan/archive/${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="${DEPEND}
		 dev-python/pygtk
		 dev-python/pyxdg
		 dev-python/pygobject:3"
