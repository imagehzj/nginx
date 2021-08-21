FROM ttbb/base

LABEL maintainer="shoothzj@gmail.com"

WORKDIR /opt/sh

COPY source /opt/sh

RUN wget http://nginx.org/download/nginx-1.21.1.tar.gz && \
mkdir nginx && \
tar -xf nginx-1.21.1.tar.gz -C nginx --strip-components 1 && \
rm -rf nginx-1.21.1.tar.gz && \
mkdir ~/.vim && \
cp -r nginx/contrib/vim/* ~/.vim/ && \
cd  /opt/sh/nginx && \
yum install -y gcc pcre-devel make zlib-devel  && \
./configure && \
make && \
make install && \
echo "export PATH=$PATH:/usr/local/nginx/sbin" >> /etc/bashrc


WORKDIR /usr/local/nginx