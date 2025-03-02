all: compile

mac: generateMac
	cd build && ninja

compile: generate
	cd build && ninja

generate: mkBuildDir
	# cd build && cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=~/llvm-install -D_GLIBCXX_ASSERTIONS=ON
	cd build && cmake -G Ninja ../llvm \
		-DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb" \
		-DCMAKE_BUILD_TYPE=Debug \
		-DCMAKE_INSTALL_PREFIX=~/llvm-install \
		-D_GLIBCXX_ASSERTIONS=ON 

generateMac: mkBuildDir
	# cd build && cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=~/llvm-install -D_GLIBCXX_ASSERTIONS=ON
	cd build && cmake -G Ninja ../llvm \
		-DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb" \
		-DCMAKE_BUILD_TYPE=Debug \
		-DCMAKE_INSTALL_PREFIX=~/llvm-install \
		-D_GLIBCXX_ASSERTIONS=ON \
		-DLLDB_INCLUDE_TESTS=OFF

mkBuildDir:
	mkdir -p build

install:
	mkdir -p install
	cp build/bin/clang-format install/clang-format
	cp build/bin/clang-tidy install/clang-tidy

test:
	cd build && ninja check-all

release:
	cd build && cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=~/llvm-install

documentation:
	doxygen doxyconfig
