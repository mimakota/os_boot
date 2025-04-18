FROM rust:1.70.0

RUN apt update && apt -y install qemu-system-x86 qemu-utils ovmf curl　


RUN curl https://sh.rustup.rs -sSf | sh -s -- -y



#xhost +local:docker
#docker-compose up