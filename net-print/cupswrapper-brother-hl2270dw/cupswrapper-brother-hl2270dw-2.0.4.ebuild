# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit rpm

DESCRIPTION="CUPS driver for Brother HL2270-DW"
HOMEPAGE="http://www.brother-usa.com/printer/modeldetail.aspx?PRODUCTID=HL2270DW"
SRC_URI="http://www.brother.com/pub/bsc/linux/dlf/cupswrapperHL2270DW-${PV}-2.i386.rpm"
S="${WORKDIR}/usr/local/Brother/Printer/HL2270DW/cupswrapper"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
         >=net-print/lpdfilter-brother-hl2270dw-2.1.0"

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
   sed -n '69,347p;347q' cupswrapperHL2270DW-2.0.4 > HL2270DW.ppd
   chmod 755 HL2270DW.ppd
   mkdir -p ${D}/usr/share/cups/model/
   cp HL2270DW.ppd ${D}/usr/share/cups/model/
   mkdir -p ${D}/usr/share/ppd
   cp HL2270DW.ppd ${D}/usr/share/ppd
   
   sed -n '368,527p;527q' cupswrapperHL2270DW-2.0.4 > brlpdwrapperHL2270DW
   # Fix unfortunate snafus with \$ and \`
   sed -i 's/\\\$/\$/g' brlpdwrapperHL2270DW
   sed -i 's/\\`/`/g' brlpdwrapperHL2270DW
   
   
   chmod 755 brlpdwrapperHL2270DW
   mkdir -p ${D}/usr/lib/cups/filter/
   cp brlpdwrapperHL2270DW ${D}/usr/lib/cups/filter/
   mkdir -p ${D}/usr/lib64/cups/filter/
   cp brlpdwrapperHL2270DW ${D}/usr/lib64/cups/filter/
   
   mkdir -p ${D}/usr/local/Brother/Printer/HL2270DW/cupswrapper/
   cp brcupsconfig4 ${D}/usr/local/Brother/Printer/HL2270DW/cupswrapper/brcupsconfig4
}

pkg_postinst() {
   elog "You may need to run '/etc/init.d/cupsd restart' to use this driver"
}
