# LLVM Docker Image

## This docker image is based on Ubuntu 18.04, and It has the LLVM v8.0 packages, such as:
- llvm-8-dev
- llvm-8-examples
- clang-tools-8
- libclang-8-dev
- clang-format-8
- libc++-8-dev
- clang-tidy-8

## The LLVM packages as installed from:
- deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main
- deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main

## How to build:
- $ docker build -t herberthb/llvm-docker-dev:v8 --no-cache -f Dockerfile .

## Avaliable at Docker Hub:
- $ docker pull herberthb/llvm-docker-dev:v8

