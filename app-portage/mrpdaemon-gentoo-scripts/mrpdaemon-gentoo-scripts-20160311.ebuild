# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="mrpdaemon's scripts for maintaining Gentoo systems"
HOMEPAGE="https://github.com/mrpdaemon/mrpdaemon-gentoo-scripts"
SRC_URI="https://github.com/mrpdaemon/${PN}/archive/${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-portage/eix
	app-portage/layman
	app-portage/gentoolkit"

src_install() {
	dosbin gentoo-update.sh
	dosbin kernel-upgrade.sh
	dosbin kernel-cleanup.sh
	dosbin maint-gentoo.sh
}
