# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info

DESCRIPTION="The Linux Precision Time Protocol (PTP) implementation"
#HOMEPAGE="http://linuxptp.sourceforge.net/"
HOMEPAGE="https://github.com/richardcochran/linuxptp"
#SRC_URI="mirror://sourceforge/${PN}/v${PV}/${P}.tgz"
#SRC_URI=https://github.com/richardcochran/linuxptp.git
#SRC_URI="https://github.com/richardcochran/linuxptp/archive/master.zip -> ${P}.zip"
#SRC_URI=https://github.com/jrovins-argo/linuxptp/archive/v2.0.1.tar.gz
SRC_URI=https://github.com/jrovins-argo/${PN}/archive/v${PV}.tar.gz

# fix up the extracted file name to match gentoo format
MY_PN="linuxptp"
MY_PV=${PV}
MY_P="${MY_PN}-${MY_PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

CONFIG_CHECK="~PPS ~NETWORK_PHY_TIMESTAMPING ~PTP_1588_CLOCK"


#src_prepare() {
#	mv linuxptp_master ${P}	
#}


src_compile() {
	export EXTRA_CFLAGS=${CFLAGS}
	emake prefix=/usr mandir=/usr/share/man
}

src_install() {
	emake \
		prefix="${D}"/usr \
		mandir="${D}"/usr/share/man \
		infodir="${D}"/usr/share/info \
		libdir="${D}"/usr/$(get_libdir) \
		install

	dodoc README.org
}
