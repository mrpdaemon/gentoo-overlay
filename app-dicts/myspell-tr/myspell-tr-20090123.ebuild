# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-dicts/myspell-tr/myspell-tr-20130123.ebuild,v 1.1 2013/07/07 13:30:59 mrpdaemon Exp $

EAPI=4

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
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

src_unpack() {
	myspell-r2_src_unpack

	mv ${WORKDIR}/tr.dic ${WORKDIR}/tr_TR.dic
	mv ${WORKDIR}/tr.aff ${WORKDIR}/tr_TR.aff
}
