# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Advanced cross-platform Google Drive client"
HOMEPAGE="https://www.insynchq.com/"
SRC_URI="
	x86?   ( http://s.insynchq.com/builds/insync-beta_${PV}_i386.deb )
	amd64? ( http://s.insynchq.com/builds/insync-beta_${PV}_amd64.deb )
	gnome? ( http://s.insynchq.com/builds/insync-beta-ubuntu_${PV}_all.deb )
	kde?   ( http://s.insynchq.com/builds/insync-beta-kde_${PV}_all.deb )
	xfce?  ( http://s.insynchq.com/builds/insync-beta-xfce_${PV}_all.deb ) "

SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND=""
RDEPEND="${DEPEND}
	gnome? ( dev-python/nautilus-python )
	kde? ( kde-base/kdelibs )
	xfce? ( dev-python/thunarx-python )"
IUSE="gnome kde xfce"

src_unpack() {
	mkdir ${S}
	cd ${S}

	if use amd64 ; then
		unpack insync-beta_${PV}_amd64.deb
	else
		unpack insync-beta_${PV}_x86.deb
	fi

	unpack ./data.tar.gz

	if use gnome ; then
		unpack insync-beta-ubuntu_${PV}_all.deb
	elif use kde ; then
		unpack insync-beta-kde_${PV}_all.deb
	elif use xfce ; then
		unpack insync-beta-xfce_${PV}_all.deb
	fi

	unpack ./data.tar.gz
}

src_install() { 
	cp -pPR ${S}/usr "${D}"/ || die "Installation failed" 

	echo "SEARCH_DIRS_MASK=\"/usr/lib*/insync\"" > "${T}/70${PN}" || die
	insinto "/etc/revdep-rebuild" && doins "${T}/70${PN}" || die
}

pkg_postinst() {
	elog "To automatically start insync add 'insync' to your session"
	elog "startup scripts. GNOME users can also choose to enable"
	elog "the insync extension via gnome-tweak-tool."
}

