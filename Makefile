all: alsadrv smf2wav

mt32emu: build-mt32emu

alsadrv: mt32emu build-alsadrv

smf2wav: mt32emu build-smf2wav

config-mt32emu:
	@echo "Configuring mt32emu"
	cd mt32emu && mkdir -p build && cd build && cmake ..

config-alsadrv: mt32emu
	@echo "Configuring alsadrv"

config-smf2wav: mt32emu
	@echo "Configuring smf2wav"
	cd mt32emu_smf2wav && mkdir -p build && cd build && cmake -DMT32EMU_LIBRARY=../../mt32emu/build/libmt32emu.a -DMT32EMU_INCLUDE_DIR=../../include ..

build-mt32emu: config-mt32emu
	@echo "Building mt32emu"
	cd mt32emu/build; make

build-alsadrv: config-alsadrv
	@echo "Building alsadrv"
	cd mt32emu_alsadrv; make

build-smf2wav: config-smf2wav
	@echo "Building mt32emu"
	cd mt32emu_smf2wav/build; make

clean:
	@echo "Cleaning"
	cd mt32emu/build; make clean
	cd mt32emu_alsadrv; make clean
	cd mt32emu_smf2wav/build; make clean

.PHONY: all mt32emu alsadrv smf2wav config-mt32emu build-mt32emu config-alsadrv build-alsadrv config-smf2wav build-smf2wav
