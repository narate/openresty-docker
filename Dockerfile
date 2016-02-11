FROM debian:latest
MAINTAINER Narate Ketram <koonnarate@gmail.com>

RUN apt-get update
RUN apt-get install libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential curl -y
RUN curl -O https://openresty.org/download/openresty-1.9.7.3.tar.gz
RUN tar -xzvf openresty-1.9.7.3.tar.gz
RUN cd openresty-1.9.7.3 && ./configure && make && make install
RUN cd ..
RUN rm -rvf openresty-1.9.7.3*
RUN echo "NGiNX modules" && /usr/local/openresty/nginx/sbin/nginx -V
RUN mkdir -p /opt
ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
RUN echo 'Done \nTo start run this command\ndocker run -it -d -p 8888:80 --name lua_api -h lua_api -v "$PWD/lua":/opt/lua openresty'

CMD ["/usr/local/openresty/nginx/sbin/nginx",  "-g", "daemon off; error_log /dev/stderr info;"]
EXPOSE 80

