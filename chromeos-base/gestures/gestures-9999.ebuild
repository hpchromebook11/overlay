# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit toolchain-funcs multilib 

DESCRIPTION="Gesture recognizer library"
HOMEPAGE="http://www.chromium.org/"
SRC_URI="http://techweblogs.com/gestures-9999.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

LIBCHROME_VERS="180609"

RDEPEND="dev-cpp/gflags
	sys-fs/udev"
DEPEND="dev-cpp/gtest
	x11-libs/libXi
	${RDEPEND}"

src_configure() {
	econf
}

src_compile() {
	tc-export CXX
	export BASE_VER=${LIBCHROME_VERS}

	emake clean  # TODO(adlr): remove when a better solution exists
	emake
}

src_test() {
	emake test

	if ! use x86 && ! use amd64 ; then
		einfo "Skipping tests on non-x86 platform..."
	else
		./test || die
	fi
}

src_install() {
	emake DESTDIR="${D}" LIBDIR="/usr/$(get_libdir)" install
}
