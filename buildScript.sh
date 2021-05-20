#!/bin/bash

# Variables
A52Q=false
A72Q=false
BUILD=false
CLEANUP=false

# Export ALLOW MISSING DEPENDENCIES
export ALLOW_MISSING_DEPENDENCIES="true"

# CCACHE
export CCACHE="$(which ccache)"
export CCACHE_COMPRESS="1"
export USE_CCACHE="1"
ccache -M 50G

POSITIONAL=()
while [[ $# -gt 0 ]]; do
   key="$1"

   case $key in
   -c)
      CLEANUP=true
      shift
      ;;
   -a52q)
      A52Q=true
      BUILD=true
      shift
      ;;
   -a72q)
      A72Q=true
      BUILD=true
      shift
      ;;
   *)
      POSITIONAL+=("$1")
      shift
      ;;
   esac
done
set -- "${POSITIONAL[@]}" # restore positional

if [ "${CLEANUP}" == true ]; then
    if [ -d "$(pwd)/out" ]; then
        rm -rf "$(pwd)/out"
    fi
fi

[ "${BUILD}" == true ]; source build/envsetup.sh

if [ "${A52Q}" == true ]; then
    lunch omni_a52q-eng
    mka recoveryimage
fi

if [ $? -eq 0 ]; then
    if [ "${A72Q}" == true ]; then
        source build/envsetup.sh
        lunch omni_a72q-eng
        mka recoveryimage
    fi
fi
