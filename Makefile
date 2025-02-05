all: compile

compile: generate
	cd build && ninja

generate: mkBuildDir
	cd build && cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra;lld' -DCMAKE_BUILD_TYPE=Release

mkBuildDir:
	mkdir -p build

install:
	mkdir -p install
	cp build/bin/clang-format install/clang-format
	cp build/bin/clang-tidy install/clang-tidy

test:
	cd build && ninja check-all

