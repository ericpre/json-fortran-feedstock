#!/bin/bash
set -ex
cmake $CMAKE_ARGS -B_build -GNinja -DUSE_GNU_INSTALL_CONVENTION=true -DSKIP_DOC_GEN=true
cmake --build _build

if [[ $build_platform == $target_platform ]]; then
	cmake --build _build --target check
fi

cmake --install _build