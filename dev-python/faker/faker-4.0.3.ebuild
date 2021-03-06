# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Python package that generates fake data"
HOMEPAGE="
	https://github.com/joke2k/faker
	https://pypi.org/project/Faker
"
SRC_URI="https://github.com/joke2k/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/python-dateutil-2.4[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/text-unidecode-1.3[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	>=dev-python/sphinx-2.4[${PYTHON_USEDEP}]
	<dev-python/sphinx-3.0[${PYTHON_USEDEP}]
	test? (
		<dev-python/freezegun-0.4[${PYTHON_USEDEP}]
		dev-python/more-itertools[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.4.0[${PYTHON_USEDEP}]
		<dev-python/pytest-5.5[${PYTHON_USEDEP}]
		dev-python/random2[${PYTHON_USEDEP}]
		>=dev-python/ukpostcodeparser-1.1.1[${PYTHON_USEDEP}]
		>=dev-python/validators-0.13.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
#TODO: make docs working
#distutils_enable_sphinx docs --no-autodoc
