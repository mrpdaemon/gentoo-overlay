# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ASPELL_LANG="Turkish"

inherit aspell-dict

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=app-text/aspell-0.50"
