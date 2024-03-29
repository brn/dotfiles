# -*- mode: shell-script ; coding: utf-8-unix -*-
#! /bin/sh
# export PATH="/cygdrive/c/cygwin-x86_64/tmp/cmake-3.1.0-win32-x86/bin/:$PATH"

rm -rf CMakeCache.txt
rm -rf cmake_install.cmake
rm -rf CMakeFiles
rm -rf Makefile

declare BUILD_OPTIONS="${0}.opt"

cp -p ${BUILD_OPTIONS}.template ${BUILD_OPTIONS}


# switch compiler
# export CC=clang
# export CXX=clang++
# declare TARGET_CLANG_VERSION="${1-390}"
declare TARGET_CLANG_VERSION
declare TARGET_CONFIG
declare LLVM_BUILD_SHELLS_PATH
declare INSTALL_PREFIX=""

# overwrite vars load
if [ -e "./${BUILD_OPTIONS}" ]; then
    . "./${BUILD_OPTIONS}"
fi


declare -r LLVM_LIBRARY_PATH="${LLVM_BUILD_SHELLS_PATH}/sh/clang-${TARGET_CLANG_VERSION}/build-${TARGET_CONFIG}"


declare -p TARGET_CLANG_VERSION
declare -p TARGET_CONFIG
declare -p LLVM_BUILD_SHELLS_PATH
declare -p LLVM_LIBRARY_PATH
declare -p INSTALL_PREFIX


# cmake --version
echo cmake -G "Unix Makefiles" ../clang-server -DLIBRARY_PATHS="${LLVM_LIBRARY_PATH}" -DCMAKE_BUILD_TYPE=${TARGET_CONFIG} -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake -G "Unix Makefiles" ../clang-server -DLIBRARY_PATHS="${LLVM_LIBRARY_PATH}" -DCMAKE_BUILD_TYPE=${TARGET_CONFIG} -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

# echo "please press Enter key"
# read discard_tmp


# cmake --build . [--config <config>] [--target <visual studio project name>] [-- -i]
cmake --build . --config ${TARGET_CONFIG}
# sudo make install


