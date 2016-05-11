FROM shane/docker-link:xenial

RUN mkdir -p $TOOLS_DIR/node/ \
 && cd $TOOLS_DIR/node \
 && curl -sSL https://nodejs.org/dist/v6.1.0/node-v6.1.0-linux-x64.tar.gz \
     | tar -xzv --strip=1 \
 && rm -rf share include \
 && echo "#!/bin/bash \n export PATH=\"\$PATH:$TOOLS_DIR/docker:$TOOLS_DIR/node/bin\" && exec \"\$@\"" \
      > $TOOLS_DIR/node/enter \
 && chmod +x $TOOLS_DIR/node/enter \
 && $TOOLS_DIR/node/bin/node $TOOLS_DIR/node/bin/npm install -g \
       mustache js-yaml lodash \
       gulp nodemon shelljs

VOLUME $TOOLS_DIR/node
ENV PATH=$PATH:$TOOLS_DIR/node/bin
ENTRYPOINT ["/bin/bash", "/tools/node/enter"]
CMD ["/bin/bash", "/tools/docker/docker-tunnel-socket"]

MAINTAINER Shane Holloway <shane.holloway@ieee.org>
