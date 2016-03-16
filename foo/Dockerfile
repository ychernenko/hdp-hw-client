FROM ychernenko/hdp-hw-client

ENV TMP_DIR=/tmp

COPY * ${TMP_DIR}/

WORKDIR ${TMP_DIR}

RUN ./install.sh

WORKDIR /