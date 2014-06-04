# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Advanced cross-platform Google Drive client"
HOMEPAGE="https://www.insynchq.com/"
SRC_URI="
	x86?      ( http://s.insynchq.com/builds/insync_${PV}_i386.deb )
	amd64?    ( http://s.insynchq.com/builds/insync_${PV}_amd64.deb )
	nautilus? ( http://s.insynchq.com/builds/insync-nautilus_${PV}_all.deb )
	dolphin?  ( http://s.insynchq.com/builds/insync-dolphin_${PV}_all.deb )
	thunar?   ( http://s.insynchq.com/builds/insync-thunar_${PV}_all.deb )
	nemo?   ( http://s.insynchq.com/builds/insync-nemo_${PV}_all.deb )
	caja?   ( http://s.insynchq.com/builds/insync-caja_${PV}_all.deb )"

SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
DEPEND=""
RDEPEND="${DEPEND}
	nautilus? ( dev-python/nautilus-python )
	dolphin? ( kde-base/dolphin )
	thunar? ( dev-python/thunarx-python )
	nemo? ( gnome-extra/nemo )
	caja? ( mate-base/caja )"
IUSE="nautilus dolphin thunar nemo caja"

src_unpack() {
	mkdir "${S}"
	cd "${S}"

	if use amd64 ; then
		unpack insync_"${PV}"_amd64.deb
	else
		unpack insync_"${PV}"_i386.deb
	fi

	unpack ./data.tar.gz

	if use nautilus ; then
		unpack insync-nautilus_"${PV}"_all.deb
	elif use dolphin ; then
		unpack insync-dolphin_"${PV}"_all.deb
	elif use thunar ; then
		unpack insync-thunar_"${PV}"_all.deb
	elif use nemo ; then
		unpack insync-nemo_"${PV}"_all.deb
	elif use caja ; then
		unpack insync-caja_"${PV}"_all.deb
	fi

	unpack ./data.tar.gz
}

src_install() {
	cp -pPR "${S}"/usr "${D}"/ || die "Installation failed"

	echo "SEARCH_DIRS_MASK=\"/usr/lib*/insync\"" > "${T}/70${PN}" || die
	insinto "/etc/revdep-rebuild" && doins "${T}/70${PN}" || die
}

pkg_postinst() {
	elog "To automatically start insync add 'insync' to your session"
	elog "startup scripts. GNOME users can also choose to enable"
	elog "the insync extension via gnome-tweak-tool."
}
