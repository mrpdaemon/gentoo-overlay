# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit rpm

DESCRIPTION="LPD filter for Brother HL2270-DW"
HOMEPAGE="http://www.brother-usa.com/printer/modeldetail.aspx?PRODUCTID=HL2270DW"
SRC_URI="http://www.brother.com/pub/bsc/linux/dlf/hl2270dwlpr-${PV}-1.i386.rpm"
S="${WORKDIR}"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
   chmod a+w usr/local/Brother/Printer/HL2270DW/inf/brHL2270DWrc
   chmod a+w usr/local/Brother/Printer/HL2270DW/inf
   cp -r usr ${D}
   cp -r var ${D}
}
