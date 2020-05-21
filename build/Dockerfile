# Use official ubuntu release
FROM ubuntu:18.04 as build


#Download URLs for the radsecproxy and openssl
ENV RADSECURL https://github.com/radsecproxy/radsecproxy/releases/download/1.8.1/
ENV RADSECFILENAME radsecproxy-1.8.1.tar.gz
ENV OPENSSL https://www.openssl.org/source/
ENV OPENSSLFILENAME openssl-1.1.1c.tar.gz


#Create the Working dir
RUN mkdir /radsecproxy

# Change working dir
WORKDIR /radsecproxy

# Update apk
RUN apt-get update -y


# Install buildtools
RUN  apt-get install systemd make-guile build-essential -y
RUN apt-get update -y
RUN apt-get install wget openssl ca-certificates gcc build-essential nettle-dev build-essential checkinstall zlib1g-dev iputils-ping -y

#Run openssl
RUN wget ${OPENSSL}${OPENSSLFILENAME}
RUN tar -xf ${OPENSSLFILENAME} --strip-components=1
RUN ./config --prefix=/root/output --openssldir=/usr/local/ssl shared zlib
RUN make && make install

#radsecproxy
# Download Radsecproxy source files
RUN wget ${RADSECURL}${RADSECFILENAME}
RUN tar xf ${RADSECFILENAME} --strip-components=1
RUN ./configure --prefix=/root/output --sysconfdir=/usr/local/etc --with-ssl=/root/output/
RUN make && make install

# --- --- ---


# Create Radsecproxy container
FROM ubuntu:18.04

# Install openssl, ca-certificates
RUN apt-get update -y
RUN apt-get install  openssl ca-certificates -y


# Copy from 'build' stage
COPY --from=build /root/output/ /usr/local/


# Copy start.sh
COPY start.sh /radsecproxy/start.sh
# Make start.sh executeable
RUN chmod u+x /radsecproxy/start.sh


WORKDIR /root



CMD [ "/radsecproxy/start.sh" ]
