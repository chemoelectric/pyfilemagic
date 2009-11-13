# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils git

DESCRIPTION="A SWIG-made interface to libmagic"
HOMEPAGE="http://github.com/chemoelectric/pyfilemagic"
SRC_URI=""
EGIT_REPO_URI="git://github.com/chemoelectric/pyfilemagic.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-lang/python-2.6.4
	>=sys-apps/file-5.03
	"
DEPEND="
	>=dev-lang/swig-1.3.40
	${RDEPEND}
	"

S="${WORKDIR}/${PN}"

src_compile() {
	cd "${S}"
	swig -python ${PN}.i || die "swig failed"
	distutils_src_compile || die "distutils_src_compile failed"
}
