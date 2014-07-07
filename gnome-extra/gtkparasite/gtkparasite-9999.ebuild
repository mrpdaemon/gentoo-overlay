# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools gnome2 git-2

EGIT_REPO_URI="git://github.com/chipx86/gtkparasite.git"

DESCRIPTION="Tool for GTK debugging and live interaction"
HOMEPAGE="http://gtkparasite.googlecode.com/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python"

DEPEND=">=x11-libs/gtk+-3.10.0:3
	x11-libs/gtksourceview:3.0
	python? ( dev-python/pygobject:3
	          dev-python/pygtk )"
RDEPEND="${RDEPEND}"

src_unpack() {
	git-2_src_unpack
	cd ${S}
	eautoreconf
}
