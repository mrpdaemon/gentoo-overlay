# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="A tiling terminal emulator for Linux using GTK+ 3"
HOMEPAGE="https://github.com/gnunn1/terminix"
SRC_URI="https://github.com/gnunn1/terminix/releases/download/$PV/terminix.zip -> terminix-bin-$PV.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND="
	dev-libs/glib:2
	>=x11-libs/gtk+-3.14:3
	>=x11-libs/vte-0.42:2.91
	gnome-base/dconf
	dev-python/nautilus-python
"
DEPEND="${RDEPEND}"

S=${WORKDIR}

src_install() {
	insinto /usr
	doins -r usr/share || die

	into /usr
	dobin usr/bin/terminix || die
}

pkg_postinst()
{
	glib-compile-schemas /usr/share/glib-2.0/schemas/
}
