FROM mcr.microsoft.com/devcontainers/base:debian

LABEL org.opencontainers.image.source=https://github.com/gvdenbro/devcontainers
LABEL org.opencontainers.image.description="a jdk17/quarto devcontainer"

ARG USERNAME=vscode

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    openjdk-17-jdk \
    openjdk-17-dbg \
    openjdk-17-source \
    chromium \
    libmagick++-dev \
    fd-find \
    ripgrep \
    fzf \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    vim \
    moreutils

ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
ENV PATH "${JAVA_HOME}/bin:${PATH}"
ENV LANG en_US.UTF-8
