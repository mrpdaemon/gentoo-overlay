# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MYSPELL_DICT=(
	"tr_TR.aff"
	"tr_TR.dic"
)

inherit myspell-r2

DESCRIPTION="Turkish dictionaries for myspell/hunspell"
HOMEPAGE="https://code.google.com/p/tr-spell/"
SRC_URI="https://tr-spell.googlecode.com/files/dict_aff_5000_suffix_1130000_words.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	# Rename to proper country_LANG format
	mv "${WORKDIR}"/tr.dic "${WORKDIR}"/tr_TR.dic
	mv "${WORKDIR}"/tr.aff "${WORKDIR}"/tr_TR.aff
}
