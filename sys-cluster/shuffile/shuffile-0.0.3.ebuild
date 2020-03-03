# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake-utils

DESCRIPTION="SHUFFILE Shuffle files between processes"
HOMEPAGE="https://github.com/ECP-VeloC/shuffile"
SRC_URI="https://github.com/ECP-VeloC/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=sys-cluster/KVTree-1.0.2
	sys-libs/zlib
	virtual/mpi
"
DEPEND="${RDEPEND}"
BDEPEND="
	>=dev-util/cmake-2.8
"

src_prepare() {
	#do not build static library
	sed -i '/shuffile-static/d' src/CMakeLists.txt || die
	default
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DMPI="ON"
	)
	cmake-utils_src_configure
}