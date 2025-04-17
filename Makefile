x86_64-unknown-uefi:
	rustup component add rust-src --toolchain nightly || true
	cd ./uefi && cargo +nightly build -Z build-std=core,alloc --target x86_64-unknown-uefi

cp-efi: x86_64-unknown-uefi
	mkdir -p ./esp/efi/boot
	cp ./uefi/target/x86_64-unknown-uefi/debug/uefi.efi ./esp/efi/boot/bootx64.efi

.PHONY: boot
boot: cp-efi
	qemu-system-x86_64 -bios OVMF.fd -drive format=raw,file=fat:rw:esp
