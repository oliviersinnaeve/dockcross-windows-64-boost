FROM dockcross/linux-armv7

ENV DEFAULT_DOCKCROSS_IMAGE b2beyond/docker-windows-64-boost

RUN echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" > /etc/apt/sources.list.d/mxeapt.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB

RUN apt-get update || apt-get update
RUN apt-get install -yy apt-transport-https
RUN apt-get upgrade -yy
RUN apt-get install -yy mxe-i686-w64-mingw32.static-boost
