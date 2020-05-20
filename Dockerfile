FROM ubuntu:20.04

MAINTAINER dayflower <daydream.trippers@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN set -x && \
    apt-get update && \
    apt-get install -y devscripts debhelper libibus-1.0-dev pkg-config libxcb-xfixes0-dev libgtk2.0-dev python3-dev gyp protobuf-compiler libprotobuf-dev qtbase5-dev libqwt-qt5-dev libgwengui-qt5-dev libuim-dev libzinnia-dev fcitx-libs-dev gettext desktop-file-utils ninja-build

RUN set -x && \
    cd /root && \
    curl -v -L -o mozc.tar.xz 'https://osdn.net/frs/chamber_redir.php?m=jaist&f=%2Fusers%2F26%2F26307%2Fmozc-2.23.2815.102%2Bdfsg%7Eut2-20171008d%2B20200423focal.tar.xz' && \
    mkdir mozc && \
    tar xvf mozc.tar.xz --strip-components=1 -C mozc && \
    cd mozc/mut && \
    debuild -b -uc -us -d && \
    cd /root/mozc && \
    rm -rf mut build_mozc_plus_utdict


FROM alpine:latest

RUN mkdir -p /mozc/deb && mkdir -p /mozc/ddeb

COPY --from=0 /root/mozc/*.deb /mozc/deb/
COPY --from=0 /root/mozc/*.ddeb /mozc/ddeb/
