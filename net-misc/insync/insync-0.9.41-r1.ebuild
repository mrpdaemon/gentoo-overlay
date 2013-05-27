# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Advanced cross-platform Google Drive client"
HOMEPAGE="https://www.insynchq.com/"
SRC_URI="
	x86? ( gnome? ( http://s.insynchq.com/builds/insync-beta-gnome-cinnamon-common_${PV}_i386.deb )
		!gnome? ( kde? ( http://s.insynchq.com/builds/insync-beta-kde_${PV}_i386.deb )
			!kde? ( xfce? ( http://s.insynchq.com/builds/insync-beta-xfce_${PV}_i386.deb )
				!xfce? ( http://s.insynchq.com/builds/insync-beta-ubuntu_${PV}_i386.deb ) ) ) )
	amd64? ( gnome? ( http://s.insynchq.com/builds/insync-beta-gnome-cinnamon-common_${PV}_amd64.deb )
		!gnome? ( kde? ( http://s.insynchq.com/builds/insync-beta-kde_${PV}_amd64.deb )
			!kde? ( xfce? ( http://s.insynchq.com/builds/insync-beta-xfce_${PV}_amd64.deb )
				!xfce? ( http://s.insynchq.com/builds/insync-beta-ubuntu_${PV}_amd64.deb ) ) ) )
	gnome? ( http://s.insynchq.com/builds/insync-beta-gnome_0.9.40_all.deb )"

SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND=""
RDEPEND="${DEPEND}
	gnome? ( dev-python/nautilus-python )
	kde? ( kde-base/kdelibs )
	xfce? ( xfce-base/xfce4-meta )
	!gnome? ( !kde? ( !xfce? ( dev-libs/libappindicator ) ) )
	!app-arch/deb2targz"
IUSE="gnome kde xfce"


src_unpack() {
	mkdir ${S}
	cd ${S}

	if use gnome ; then
		unpack insync-beta-gnome_0.9.40_all.deb
		unpack ./data.tar.gz
	fi

	if use amd64 ; then
		if use gnome ; then
			unpack insync-beta-gnome-cinnamon-common_${PV}_amd64.deb
		elif use kde ; then
			unpack insync-beta-kde_${PV}_amd64.deb
		elif use xfce ; then
			unpack insync-beta-xfce_${PV}_amd64.deb
		else
			unpack insync-beta-ubuntu_${PV}_amd64.deb
		fi
	else
		if use gnome ; then
			unpack insync-beta-gnome-cinnamon-common_${PV}_i386.deb
		elif use kde ; then
			unpack insync-beta-kde_${PV}_i386.deb
		elif use xfce ; then
			unpack insync-beta-xfce_${PV}_i386.deb
		else
			unpack insync-beta-ubuntu_${PV}_i386.deb
		fi
	fi

	unpack ./data.tar.gz
}

src_install() {
	cp -pPR ${S}/usr "${D}"/ || die "Installation failed"

	echo "SEARCH_DIRS_MASK=\"/usr/lib*/insync\"" > "${T}/70${PN}" || die
	insinto "/etc/revdep-rebuild" && doins "${T}/70${PN}" || die
}

pkg_postinst() {
	elog "To automatically start insync add 'insync --gnome' or 'insync --kde' "
	elog "or 'insync --xfce' to your session startup scripts. GNOME users can "
	elog "also choose to enable the insync extension via gnome-tweak-tool. KDE "
	elog "users can install additional plasmoids from: https://www.insynchq.com/linux"
}
