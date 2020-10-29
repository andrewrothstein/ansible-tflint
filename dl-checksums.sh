#!/usr/bin/env sh
set -e
DIR=~/Downloads
APP=tflint
GHUSER=terraform-linters
MIRROR=https://github.com/${GHUSER}/${APP}/releases/download

dl() {
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-zip}
    local platform="${os}_${arch}"
    local file="${APP}_${platform}.${archive_type}"
    local url="$MIRROR/$ver/$file"
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    local url="$MIRROR/$ver/checksums.txt"
    local lchecksums="$DIR/${APP}_${ver}_checksums.txt"
    if [ ! -e $lchecksums ];
    then
        wget -q -O $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  %s:\n" $ver

    dl $ver $lchecksums darwin amd64
    dl $ver $lchecksums freebsd 386
    dl $ver $lchecksums freebsd amd64
    dl $ver $lchecksums freebsd arm
    dl $ver $lchecksums netbsd 386
    dl $ver $lchecksums netbsd amd64
    dl $ver $lchecksums netbsd arm
    dl $ver $lchecksums openbsd 386
    dl $ver $lchecksums openbsd amd64
    dl $ver $lchecksums openbsd arm
    dl $ver $lchecksums linux 386
    dl $ver $lchecksums linux amd64
    dl $ver $lchecksums linux arm
    dl $ver $lchecksums windows 386
    dl $ver $lchecksums windows amd64
}

dl_ver ${1:-v0.20.3}
