FROM ekgf/debian-openjdk-python3-awscli:0.0.1

ENV TARQL_VERSION="1.2"

#
# Put this section, where we install ontop, above all the ENV vars and the COPY statement that might change a lot
# so that we don't have to waste time on waiting for ontop installation.
#
RUN set -x ; mkdir -p /builder && \
    cd /builder && \
    curl -L https://github.com/tarql/tarql/releases/download/v${TARQL_VERSION}/tarql-${TARQL_VERSION}.tar.gz -o ./tarql.tar.gz && \
    tar xzf ./tarql.tar.gz && \
    rm tarql.tar.gz && \
    mv tarql-${TARQL_VERSION} tarql && \
    rm tarql/bin/tarql.bat tarql/README.md && \
    find . && \
    echo JAVA_HOME=${JAVA_HOME} && \
    chmod ug+x ./tarql/bin/tarql && \
    cat ./tarql/bin/tarql && \
    ls -al ./tarql/bin

ENV PATH=/builder/tarql/bin:$PATH

WORKDIR /app/

ENV TARQL_JAVA_ARGS="-Xmx2g"
ENV JAVA_OPTS=${TARQL_JAVA_ARGS}
