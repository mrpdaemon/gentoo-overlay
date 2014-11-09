# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2,3_3} )

inherit python-r1

DESCRIPTION="EncFS mount utility for GNOME"
HOMEPAGE="https://bitbucket.org/obensonne/gnome-encfs"

SRC_URI="https://bitbucket.org/obensonne/${PN}/get/331e2d9f8a0a.zip"
S="${WORKDIR}/obensonne-${PN}-331e2d9f8a0a"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/pygtk
	dev-python/pyxdg
	dev-python/gnome-keyring-python
	sys-fs/encfs"

src_install() {
	dobin gnome-encfs
	newdoc README.md README
}
