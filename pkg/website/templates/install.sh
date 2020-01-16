#!/bin/bash

if test -z "$BASH_VERSION"; then
  echo "Please run this script using bash, not sh or any other shell." >&2
  exit 1
fi

if [[ x`uname` == xDarwin ]]; then
  echo "This script is only supported on Linux"
  exit 1
fi

install() {
	set -euo pipefail

	dst_dir="${K14SIO_INSTALL_BIN_DIR:-/usr/local/bin}"

	echo "Installing ytt..."
	wget -O- https://github.com/k14s/ytt/releases/download/v0.24.0/ytt-linux-amd64 > /tmp/ytt
	echo "c3f1d4f04108ac1626c9b9036c7d4e407d4ff09f2577953ad72b6dc7adadbd39  /tmp/ytt" | shasum -c -
	mv /tmp/ytt ${dst_dir}/ytt
	chmod +x ${dst_dir}/ytt
	echo "Installed ${dst_dir}/ytt"

	echo "Installing kbld..."
	wget -O- https://github.com/k14s/kbld/releases/download/v0.13.0/kbld-linux-amd64 > /tmp/kbld
	echo "c5dc9a5e2fc1795f64f674cbc528a28c269432ce9485ee4dc74d8d18890dd4be  /tmp/kbld" | shasum -c -
	mv /tmp/kbld ${dst_dir}/kbld
	chmod +x ${dst_dir}/kbld
	echo "Installed ${dst_dir}/kbld"

	echo "Installing kapp..."
	wget -O- https://github.com/k14s/kapp/releases/download/v0.17.0/kapp-linux-amd64 > /tmp/kapp
	echo "696abb7e53d047d9d606da8df5965141ab5ee1a97fc06ceeddcca9fc9531520a  /tmp/kapp" | shasum -c -
	mv /tmp/kapp ${dst_dir}/kapp
	chmod +x ${dst_dir}/kapp
	echo "Installed ${dst_dir}/kapp"

	echo "Installing kwt..."
	wget -O- https://github.com/k14s/kwt/releases/download/v0.0.6/kwt-linux-amd64 > /tmp/kwt
	echo "92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0  /tmp/kwt" | shasum -c -
	mv /tmp/kwt ${dst_dir}/kwt
	chmod +x ${dst_dir}/kwt
	echo "Installed ${dst_dir}/kwt"

	echo "Installing imgpkg..."
	wget -O- https://github.com/k14s/imgpkg/releases/download/v0.1.0/imgpkg-linux-amd64 > /tmp/imgpkg
	echo "a9d0ba0edaa792d0aaab2af812fda85ca31eca81079505a8a5705e8ee1d8be93  /tmp/imgpkg" | shasum -c -
	mv /tmp/imgpkg ${dst_dir}/imgpkg
	chmod +x ${dst_dir}/imgpkg
	echo "Installed ${dst_dir}/imgpkg"
}

install
