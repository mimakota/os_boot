#![no_main]
#![no_std]
#[macro_use]

extern crate alloc;
use uefi::prelude::*;

#[entry]
fn main(handle: Handle, mut system_table: SystemTable<Boot>) -> Status {
    uefi_services::init(&mut system_table).unwrap();

    log::info!("Start of UEFI app");

    let mut mmap_buf = vec![0u8; 16384];

    let _mem_map = system_table
        .boot_services()
        .memory_map(&mut mmap_buf)
        .expect("Failed to get memory map");

    log::info!("Got memory map");
    
    log::info!("Exited boot services!");

    let (_system_table, _final_map) = system_table.exit_boot_services();
    Status::SUCCESS
}
