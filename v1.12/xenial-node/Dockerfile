FROM shane/docker-link:v1.12

ENV \
    # https://nodejs.org/dist/latest/ \
    NODE_VERSION=v6.3.0 \
    # https://github.com/tianon/gosu/releases \
    GOSU_VERSION=1.9 \
    # https://github.com/krallin/tini/releases \
    TINI_VERSION=v0.9.0

RUN mkdir -p $TOOLS_DIR/node/ \
 && echo "Downloading 'node' ${NODE_VERSION}" \
 && curl -sSL "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz" \
     | tar -xzv --strip=1 -C $TOOLS_DIR/node \
 && rm -rf $TOOLS_DIR/node/share $TOOLS_DIR/node/include \
  \
 && echo "Downloading 'gosu' ${GOSU_VERSION}" \
 && curl -sSL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture)" \
       -o $TOOLS_DIR/docker/gosu  \
 && echo "Downloading 'tini' ${TINI_VERSION}" \
 && curl -sSL "https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini" \
       -o $TOOLS_DIR/docker/tini  \
  \
 && echo "#!/bin/sh \n\
export PATH=\"\$PATH:$TOOLS_DIR/docker:$TOOLS_DIR/node/bin\" " \
      > $TOOLS_DIR/set-path \
 && echo "#!/bin/sh \n\
. $TOOLS_DIR/set-path \n\
exec \"\$@\"" \
      > $TOOLS_DIR/enter \
  \
 && chmod +x \
      $TOOLS_DIR/set-path \
      $TOOLS_DIR/enter \
      $TOOLS_DIR/docker/gosu \
      $TOOLS_DIR/docker/tini \
 && true

RUN . $TOOLS_DIR/set-path \
 && npm install -g \
       mustache js-yaml lodash \
       gulp nodemon shelljs \
 && true

ENV PATH=$PATH:$TOOLS_DIR/node/bin
ENTRYPOINT ["/tools/node/enter"]

MAINTAINER Shane Holloway <shane.holloway@ieee.org>
