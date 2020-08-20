# Use official alpine release
FROM alpine:latest as build


#Download URLs for the radsecproxy and openssl
ARG RADSECURL=https://github.com/radsecproxy/radsecproxy/releases/download/1.8.1/
ARG RADSECFILENAME=radsecproxy-1.8.1.tar.gz



#Create the Working dir
RUN mkdir /radsecproxy

# Change working dir
WORKDIR /radsecproxy

# Update apk
RUN apk update


# Install buildtools
RUN apk add --no-cache make g++ openssl-dev nettle-dev musl-dev


# Download Radsecproxy source files
RUN wget ${RADSECURL}${RADSECFILENAME}
RUN tar xf ${RADSECFILENAME} --strip-components=1
RUN ./configure --prefix=/root/output --sysconfdir=/etc --with-ssl=/root/output/
RUN make && make install

# --- --- ---


# Create Radsecproxy container
FROM alpine:latest

# Install openssl, ca-certificates
RUN apk update
RUN apk add --no-cache openssl ca-certificates nettle
# Install tini init system
RUN apk update \
 && apk add --no-cache tini


# Copy from 'build' stage
COPY --from=build /root/output/ /




WORKDIR /root

ENTRYPOINT ["/sbin/tini", "--"]

CMD [ "/sbin/radsecproxy","-f","-c","/etc/radsecproxy.conf","-i","/var/run/radsecproxy.pid" ]

