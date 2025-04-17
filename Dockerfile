FROM rust:1.70.0


# 必要パッケージのインストール
RUN apt update && apt -y install qemu-system-x86 qemu-utils ovmf curl　


# rustup をインストールし、PATHを通す
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y



#xhost +local:docker
#docker-compose up