FROM centos:centos6

ENV TMP_DIR=/tmp

COPY install.sh \
    hdp-hw.repo \
    $TMP_DIR/

WORKDIR $TMP_DIR

RUN ./install.sh

WORKDIR /