FROM gliderlabs/alpine:3.4
MAINTAINER Willem willemvd@github

ENV OC_VERSION 3.3
ENV OC_FULL_VERSION 3.3.1.4-1

RUN apk-install ca-certificates openssl && \
      wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
      apk-install -X http://apkproxy.heroku.com/sgerrand/alpine-pkg-glibc glibc glibc-bin && \
      cd /tmp && \
      wget https://s3.amazonaws.com/oso-preview-docker-registry/client-tools/${OC_VERSION}/oc-${OC_FULL_VERSION}-linux.tar.gz && \
      tar zxvf /tmp/oc-${OC_FULL_VERSION}-linux.tar.gz -C /usr/bin && \
      rm -rf /tmp/oc-${OC_FULL_VERSION}-linux.tar.gz

CMD oc