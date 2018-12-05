FROM alpine AS qemu
ARG QEMU_VERSION=v2.11.0
ADD https://github.com/multiarch/qemu-user-static/releases/download/${QEMU_VERSION}/qemu-aarch64-static /qemu-aarch64-static
RUN chmod +x /qemu-aarch64-static


FROM sarkar1986chandan/aiortc_arm_python:1.0
COPY --from=qemu /qemu-aarch64-static /usr/bin/qemu-aarch64-static
WORKDIR /root
RUN apt-get install -y cmake && \
    git clone --depth 1 https://github.com/opencv/opencv
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -B/root/build -H/root/opencv
WORKDIR /root/build
RUN make
