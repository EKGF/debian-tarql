FROM ekgf/debian-openjdk-python3-awscli:0.0.2
#
# debian-openjdk-python3-awscli created the user ekgprocess (in the group "root", see openshift comments in base image)
# with home directory /home/ekgprocess
#

ENV TARQL_VERSION="1.2"

#
# Put this section, where we install ontop, above all the ENV vars and the COPY statement that might change a lot
# so that we don't have to waste time on waiting for ontop installation.
#
USER root
RUN set -x ; mkdir -p /home/ekgprocess/builder && \
    cd /home/ekgprocess/builder && \
    curl -L https://github.com/tarql/tarql/releases/download/v${TARQL_VERSION}/tarql-${TARQL_VERSION}.tar.gz -o ./tarql.tar.gz && \
    tar xzf ./tarql.tar.gz && \
    rm tarql.tar.gz && \
    mv tarql-${TARQL_VERSION} tarql && \
    rm tarql/bin/tarql.bat tarql/README.md && \
    find . && \
    echo JAVA_HOME=${JAVA_HOME} && \
    chmod ug+x ./tarql/bin/tarql && \
    cat ./tarql/bin/tarql && \
    ls -al ./tarql/bin && \
    mv tarql .. && cd .. && rm -rf builder && \
    chown -vR ekgprocess:root .

ENV PATH=/home/ekgprocess/tarql/bin:$PATH

#
# Switch back to ekgprcocess
#
USER ekgprocess
WORKDIR /home/ekgprocess

ENV TARQL_JAVA_ARGS="-Xmx2g"
ENV JAVA_OPTS=${TARQL_JAVA_ARGS}

#
# You can override this entrypoint if you use this image as your base image but
# if you leave it as is you can use this image just to run tarql from your
# command line.
#
ENTRYPOINT [ "/bin/bash", "/home/ekgprocess/tarql/bin/tarql" ]
