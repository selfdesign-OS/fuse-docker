# Ubuntu의 최신 이미지를 기반으로 합니다.
FROM ubuntu:latest

# 필요한 패키지를 설치
RUN apt-get update && apt-get install -y \
    bash \
    libc-bin \
    pkg-config \
    cmake \
    libudev-dev \
    ninja-build \
    python3-pytest \
    python3-pip \
    python3-venv \
    meson \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && apt install -y fuse

# 가상 환경 생성
RUN python3 -m venv /opt/venv

# 가상 환경 활성화 및 Python 패키지 설치
RUN /opt/venv/bin/pip install --no-cache-dir setuptools looseversion pytest

# 환경 변수 설정
ENV PATH="/opt/venv/bin:$PATH"

# 작업 디렉토리 설정
WORKDIR /home/ubuntu/project