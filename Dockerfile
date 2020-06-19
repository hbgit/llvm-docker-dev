############################################################
# Dockerfile to build LLVM 8.0 image 
# based on Ubuntu 18.04
# Usage:
#
#  By gitclone:
#   $ docker build -t hrocha/llvm-docker-dev:v8 --no-cache -f Dockerfile .
#
############################################################

FROM ubuntu:18.04
LABEL maintainer=<herberthb12@gmail.com>

RUN apt update
RUN apt install -y build-essential subversion cmake ninja-build python-minimal wget

# Update source list
RUN echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main" >> /etc/apt/sources.list
RUN echo "deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main" >> /etc/apt/sources.list

# get the keys from keyserver
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add -

RUN apt update
RUN apt install aptitude -y

# LLVM install
RUN aptitude install libllvm-8-ocaml-dev libllvm8 llvm-8 llvm-8-dev llvm-8-doc llvm-8-examples llvm-8-runtime -y
RUN aptitude install clang-8 clang-tools-8 clang-8-doc libclang-common-8-dev libclang-8-dev libclang1-8 clang-format-8 python-clang-8 -y
RUN aptitude install libfuzzer-8-dev -y
RUN aptitude install lldb-8 lld-8 -y

# libc++
RUN aptitude install libc++-8-dev libc++abi-8-dev -y

# OpenMP
RUN aptitude install libomp-8-dev -y

# clang-tidy
RUN aptitude install clang-tidy-8 -y

WORKDIR /
