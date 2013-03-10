# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Advanced cross-platform Google Drive client"
HOMEPAGE="https://www.insynchq.com/"
SRC_URI=" 
   x86? ( !gnome? ( http://s.insynchq.com/builds/insync-beta-ubuntu_${PV}_i386.deb )
           gnome? ( http://s.insynchq.com/builds/insync-beta-gnome-cinnamon-common_${PV}_i386.deb ) )
   amd64? ( !gnome? ( http://s.insynchq.com/builds/insync-beta-ubuntu_${PV}_amd64.deb )
            gnome? ( http://s.insynchq.com/builds/insync-beta-gnome-cinnamon-common_${PV}_amd64.deb ) )
   gnome? ( http://s.insynchq.com/builds/insync-beta-gnome_0.9.40_all.deb )
"

SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND=""
RDEPEND="${DEPEND} \
         gnome? ( dev-python/nautilus-python )"
IUSE="gnome"

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
		else
			unpack insync-beta-ubuntu_${PV}_amd64.deb
		fi
	else
		if use gnome ; then
			unpack insync-beta-gnome-cinnamon-common_${PV}_i386.deb
		else
			unpack insync-beta-ubuntu_${PV}_i386.deb
		fi
	fi

	unpack ./data.tar.gz 
}

src_install() { 
   cp -pPR ${S}/usr "${D}"/ || die "Installation failed" 
}
