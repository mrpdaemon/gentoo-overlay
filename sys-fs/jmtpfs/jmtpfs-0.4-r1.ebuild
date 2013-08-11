# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="A FUSE based MTP filesystem designed to make exchanging files between Android devices and Linux"
HOMEPAGE="http://research.jacquette.com/jmtpfs-exchanging-files-between-android-devices-and-linux/"
SRC_URI="http://research.jacquette.com/wp-content/uploads/2012/05/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=media-libs/libmtp-1.1.0
	>=sys-fs/fuse-2.6"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/"${PN}"-gcc-4.7-compile-fix.patch
}
