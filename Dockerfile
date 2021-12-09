FROM ttbb/base

LABEL maintainer="shoothzj@gmail.com"

WORKDIR /opt/sh

RUN wget http://nginx.org/download/nginx-1.21.4.tar.gz && \
mkdir nginx && \
tar -xf nginx-1.21.4.tar.gz -C nginx --strip-components 1 && \
rm -rf nginx-1.21.4.tar.gz && \
mkdir ~/.vim && \
cp -r nginx/contrib/vim/* ~/.vim/ && \
cd  /opt/sh/nginx && \
dnf install -y gcc pcre-devel make zlib-devel openssl-devel && \
./configure --with-http_ssl_module && \
make && \
make install && \
dnf clean all && \
echo "export PATH=$PATH:/usr/local/nginx/sbin" >> /etc/bashrc


WORKDIR /usr/local/nginx