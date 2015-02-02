# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-input-evdev/xf86-input-evdev-2.9.1.ebuild,v 1.1 2014/11/27 07:35:42 remi Exp $

EAPI=5
inherit linux-info xorg-2

DESCRIPTION="Linux cmt driver"
KEYWORDS="~arm"
IUSE=""

SRC_URI="http://techweblogs.com/xf86-input-cmt.tar.gz"

RDEPEND=">=x11-base/xorg-server-1.12[udev]
	dev-libs/libevdev
	sys-libs/mtdev"
DEPEND="${RDEPEND}
	>=x11-proto/inputproto-2.1.99.3
	>=sys-kernel/linux-headers-2.6"

