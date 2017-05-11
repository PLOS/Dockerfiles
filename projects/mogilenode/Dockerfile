FROM alpine

MAINTAINER Jono <jfinger@plos.org>
LABEL vendor="Public Library of Science"

# TODO: pin library libsys-syscall-perl 0.23-1
# TODO: pin the Mogile version to something specific

RUN apk --no-cache add bash curl perl wget && \
  apk --no-cache add --virtual .build-deps make gcc g++ git patch perl-dev && \
  curl -L https://cpanmin.us | perl - App::cpanminus && \
  cpanm install --notest --force MogileFS::Server && \
  apk del .build-deps && rm -rf /root/.cpanm

RUN mkdir -p /node/device/dev1
WORKDIR /node
ADD ./mogstored.conf /node/mogstored.conf

# workaround to deal with Docker/DeviceMapper issue since Mogile will only use local filesystems
# TODO: get this working across systems again
RUN echo "$(which df) \$(echo \$@ | sed s/-l//)" > /root/df; chmod 755 /root/df
ENV PATH /root:$PATH
RUN which df

CMD ["mogstored", "-c", "./mogstored.conf"]
