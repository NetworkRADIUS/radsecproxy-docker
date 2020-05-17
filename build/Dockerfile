# Use official ubuntu release
FROM ubuntu:18.04

ENV RADSECURL https://github.com/radsecproxy/radsecproxy/releases/download/1.8.1/
ENV RADSECFILENAME radsecproxy-1.8.1.tar.gz

ENV OPENSSL https://www.openssl.org/source/
ENV OPENSSLFILENAME openssl-1.1.1c.tar.gz

ENV RADIUS_HOST 10.2.0.111
ENV RADIUS_HOSTNAME radius

# Change working dir
WORKDIR /root

# Update apk
RUN apt-get update -y

# Install buildtools
RUN  apt-get install systemd make-guile build-essential -y
RUN apt-get update -y
RUN apt-get install wget openssl ca-certificates gcc build-essential nettle-dev build-essential checkinstall zlib1g-dev iputils-ping -y


#Run openssl
RUN wget ${OPENSSL}${OPENSSLFILENAME}
RUN tar -xf ${OPENSSLFILENAME} --strip-components=1
RUN ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib
RUN make && make install
#radsecproxy
# Download Radsecproxy source files
RUN wget ${RADSECURL}${RADSECFILENAME}
RUN tar xf ${RADSECFILENAME} --strip-components=1
RUN ./configure
RUN make && make install

# Copy start.sh
COPY start.sh /root/start.sh

# Make start.sh executeable
RUN chmod u+x /root/start.sh

# Copy from 'build' stage


# Make Radsecproxy's ports available
EXPOSE 1812
EXPOSE 1813
EXPOSE 1812/udp
EXPOSE 1813/udp

CMD [ "/root/start.sh" ]
