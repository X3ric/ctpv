# Maintainer: 3ric <github.com/X3ric>
pkgname=ctpv-x
gitname=ctpv
pkgver=1907_9.rc1.229.gf674e38_2023.06.18
pkgrel=1
pkgdesc="Fast image previews colored for lf"
arch=(i686 x86_64)
url="https://github.com/X3ric/${gitname}"
license=('MIT')
provides=('ctpv' 'ctpv-x')
depends=('file' 'openssl' 'coreutils' 'imagemagick' 'highlight')
makedepends=('git')
optdepends=(
    'atool: for archive files'
    'bat: for text files'
    'chafa: for image files on Wayland'
    'colordiff: for diff files'
    'diff-so-fancy: for diff files'
    'elinks: for html files'
    'ffmpeg: for audio files'
    'ffmpegthumbnailer: for audio files'
    'git-delta: for diff files'
    'glow: for markdown files'
    'gnupg: for gpg-encrypted files'
    'highlight: for text files'
    'imagemagick: for svg,font files'
    'jq: for json files'
    'libreoffice-fresh: for office files'
    'lynx: for html files'
    'mdcat: for markdown files'
    'perl-image-exiftool: for any files'
    'poppler: for pdf files'
    'source-highlight: for text files'
    'transmission-cli: for torrent files'
    'ueberzug: for image files on X11'
    'w3m: for html files'
)
replaces=('ctpv')
source=(git+"https://github.com/X3ric/${gitname}.git#branch=master")
md5sums=("SKIP")

pkgver() {
    cd ${gitname}
    _tag=$(git describe --tags | sed 's:^v::') # tag is mobile, and switches between numbers and letters, can't use it for versioning
    _commits=$(git rev-list --count HEAD) # total commits is the most sane way of getting incremental pkgver
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s_%s\n" "${_commits}" "${_tag}" "${_date}" | sed 's/-/./g'
}

build() {
  cd "$srcdir/$gitname"
  make LDFLAGS=-L/usr/lib
}

package() {
  cd "$srcdir/$gitname"
  local license_prefix="$pkgdir/usr/share/licenses/$pkgname"
  mkdir -p "$license_prefix"
  cp "$srcdir/$gitname/LICENSE" "$license_prefix"
  
  local doc_prefix="$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$doc_prefix"
  cp "$srcdir/$gitname/README.md" "$doc_prefix"
  
  cd "$srcdir/${gitname}"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}
