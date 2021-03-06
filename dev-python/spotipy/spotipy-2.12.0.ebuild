# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="A light weight Python library for the Spotify Web API"
HOMEPAGE="https://spotipy.readthedocs.io
	https://github.com/plamere/spotipy"
SRC_URI="https://github.com/plamere/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

IUSE="examples"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86 "
SLOT="0"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	media-sound/spotify"

DEPEND="test? ( dev-python/mock[${PYTHON_USEDEP}] )"

distutils_enable_sphinx docs
distutils_enable_tests pytest

python_prepare_all() {
	# this test requires user credentials
	rm tests/integration/test_user_endpoints.py || die

	# this test requires a spotify client ID
	rm tests/integration/test_non_user_endpoints.py || die

	distutils-r1_python_prepare_all
}

python_test() {
	pytest -vv tests || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	use examples && dodoc -r examples

	distutils-r1_python_install_all
}
