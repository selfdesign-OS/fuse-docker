# Ubuntu 22.04 이미지를 기반으로 합니다.
FROM ubuntu:22.04

# 필요한 패키지를 설치
RUN apt-get update && apt-get install -y \
    sudo \
    bash \
    libc-bin \
    pkg-config \
    cmake \
    libudev-dev \
    ninja-build \
    python3-pip \
    python3-dev \
    meson \
    fuse \
    kmod \
    && rm -rf /var/lib/apt/lists/*

# Python 패키지 설치
RUN pip3 install --no-cache-dir setuptools looseversion pytest

# 작업 디렉토리 설정
WORKDIR /home/ubuntu/project
