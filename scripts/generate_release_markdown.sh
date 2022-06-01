#!/bin/bash
set -eu

# Requires sha256sum, on osx you can do
# brew install coreutils

function print_link {
  local URL="${1}"
  local CHECKSUM="$(curl -s -S -L "${URL}" | sha256sum | awk '{print $1}')"
  echo "- ${URL}"
  echo "  - SHA-256 Checksum: \`${CHECKSUM}\`"
}

VERSION="$1" # such as 3.7.1, 4.0.0-rc1
BASE_URL="https://releases.wellsite.com/desktop/${VERSION}"

cat <<-MD
### Wellsite Desktop v${VERSION} has been cut!

Release notes can be found here: https://docs.wellsite.com/help/apps/desktop-changelog.html

The download links can be found below.

#### Windows - msi files (beta)
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-x64.msi")
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-x86.msi")

#### Windows - setup exe files
$(print_link "${BASE_URL}/wellsite-desktop-setup-${VERSION}-win.exe")

#### Windows - zip files
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-win-ia32.zip")
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-win-x64.zip")

#### Mac
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-mac-universal.dmg") (beta)
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-mac-x64.dmg")
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-mac-m1.dmg") (beta)

#### Linux
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-linux-ia32.tar.gz")
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-linux-x64.tar.gz")

#### Linux (Unofficial) - deb files
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-linux-i386.deb")
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-linux-amd64.deb")

#### Linux (Unofficial) - rpm files (beta)
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-linux-i386.rpm")
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-linux-x86_64.rpm")

#### Linux (Unofficial) - AppImage files
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-linux-i386.AppImage")
$(print_link "${BASE_URL}/wellsite-desktop-${VERSION}-linux-x86_64.AppImage")
MD
