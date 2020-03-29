# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

DESCRIPTION="A minimal HTTP client"
HOMEPAGE="
	https://github.com/encode/httpcore
	https://pypi.org/project/httpcore
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="
	dev-python/h11[${PYTHON_USEDEP}]
	dev-python/hyper-h2[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	dev-python/trio[${PYTHON_USEDEP}]
"
BDEPEND="
	doc? (
		dev-python/mkautodoc
		dev-python/mkdocs
		dev-python/mkdocs-material
	)
"
DEPEND="
	${RDEPEND}
	test? (
		dev-python/autoflake[${PYTHON_USEDEP}]
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-trio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
#todo doc