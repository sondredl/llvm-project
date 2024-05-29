
all:
	# cmake -S . -O o/ -G Ninja
	cmake -S llvm -B build -DLLVM_ENABLE_PROJECTS=clang -DLLVM_TARGETS_TO_BUILD=X86 -Thost=x64
