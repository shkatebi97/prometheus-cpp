all:		build

update-submodules:
	git submodule init
	git submodule update

run-cmake:	update-submodules
	cmake -DBUILD_SHARED_LIBS=OFF -DENABLE_PUSH=OFF -DENABLE_COMPRESSION=OFF -S . -B build

build:		run-cmake
	cmake --build build -- -j $(nproc)

install:	build
	cmake --install build

clean:
	$(RM) -r build
