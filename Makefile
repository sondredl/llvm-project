all: compile

compile: generate
	cd build && ninja

generate: mkBuildDir
	cd build && cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra' -DCMAKE_BUILD_TYPE=Release

mkBuildDir:
	mkdir -p build