# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="EncFS mount utility for GNOME"
HOMEPAGE="https://bitbucket.org/obensonne/gnome-encfs"

SRC_URI="https://bitbucket.org/obensonne/gnome-encfs/get/73ce773f5e56.zip"
S="${WORKDIR}/obensonne-${PN}-73ce773f5e56"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-lang/python"

src_install() {
	dobin gnome-encfs
}
