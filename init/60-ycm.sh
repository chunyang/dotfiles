#!/bin/bash
# Build YCM

function error() {
  echo "$@" >&2
  exit 1
}

if ! command -v cmake &>/dev/null; then
  error "Could not find cmake, not building YCM"
fi

TEMP_DIR=$(mktemp -d -t ycm_build.XXXX)

if [ -z "$TEMP_DIR" ]; then
  error "Unable to create temporary directory"
fi

# Remove TEMP_DIR on exit
function cleanup {
  rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

pushd "$TEMP_DIR"

case "$(uname -s)" in
  "Linux")
    LIBCLANG_PATH="$(readlink -f "$(ldconfig -p | grep -m1 libclang | cut -d' ' -f4)")"
    if [ $? -ne 0 ] || [ ! -f "$LIBCLANG_PATH" ]; then
        error "Cannot find libclang. Aborting"
    fi
    ;;
  "Darwin")
    LIBCLANG_PATH="/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
    if [ ! -f "$LIBCLANG_PATH" ]; then
        error "Cannot find libclang. Aborting"
    fi
    ;;
  *)
    error "Unknown operating system. Aborting"
    ;;
esac

cmake -G "Unix Makefiles" \
  -DEXTERNAL_LIBCLANG_PATH="$LIBCLANG_PATH" \
  . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp

make

vim +"PluginUpdate YouCompleteMe" +qall
