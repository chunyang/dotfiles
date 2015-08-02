# Build YCM

if ! command -v cmake &>/dev/null; then
  echo "Could not find cmake, not building YCM"
  return
fi

TEMP_DIR=$(mktemp -d)

# Remove TEMP_DIR on exit
function cleanup {
  rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

pushd "$TEMP_DIR"

cmake -G "Unix Makefiles" \
  -DEXTERNAL_LIBCLANG_PATH=/usr/lib/llvm-3.4/lib/libclang.so \
  . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp

make

vim +"PluginUpdate YouCompleteMe" +qall
