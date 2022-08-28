#!/bin/bash

# Author: Marcel Last
# Date: 2022-08-28
# Descritpion: This bash script compiles and builds Go binaries for "common"..
# operating systems and platform architecture combinations.

set -euxo pipefail

GOOS=(windows darwin linux)
GOARCH=(386 amd64 arm64)
MODULE_SOURCE=$MODULE_NAME.go

for os in "${GOOS[@]}"; do
    for arch in "${GOARCH[@]}"; do
    	artifact_output_dir=bin/$os
        artifact_name=$MODULE_NAME-v$MODULE_VERSION-$arch
        if [ $os == "windows" ]; then
            GOOS=$os GOARCH=$arch go build -o $artifact_output_dir/$artifact_name.exe $MODULE_SOURCE
        # Go version 1.15 drops support for darwin 32-bit binaries (darwin/386 and darwin/arm) [https://go.dev/doc/go1.15]
        # Skip this operating system/architecture combination.
        elif [ $os == "darwin" ] && [ $arch == "386" ]; then 
            continue
        else
	    GOOS=$os GOARCH=$arch go build -o $artifact_output_dir/$artifact_name $MODULE_SOURCE
        fi
    done
done
