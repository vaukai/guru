# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Python wrapper of telegram bots API"
HOMEPAGE="https://python-telegram-bot.org/"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/python-telegram-bot/python-telegram-bot"
else
	SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"

	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

RDEPEND="
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/PySocks[${PYTHON_USEDEP}]
	dev-python/ujson[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	www-servers/tornado[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"

# No tests because require networking access