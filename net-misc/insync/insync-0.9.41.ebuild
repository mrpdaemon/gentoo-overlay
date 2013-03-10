# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Advanced cross-platform Google Drive client"
HOMEPAGE="https://www.insynchq.com/"
SRC_URI=" 
   x86? ( http://s.insynchq.com/builds/insync-beta-ubuntu_0.9.41_i386.deb ) 
   amd64? ( http://s.insynchq.com/builds/insync-beta-ubuntu_0.9.41_amd64.deb ) 
"

SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() { 
   unpack ${A} 
   unpack ./data.tar.gz 
   rm control.tar.gz data.tar.gz debian-binary 
   mkdir ${S}
   mv usr/ ${S}
}

src_install() { 
   cp -pPR ${S}/* "${D}"/ || die "Installation failed" 
}
