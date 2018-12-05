FROM sarkar1986chandan/aiortc_arm_python:1.0
WORKDIR /root
RUN apt-get install -y cmake && \
    git clone --depth 1 https://github.com/opencv/opencv
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -B/root/build -H/root/opencv
WORKDIR /root/build
RUN make
