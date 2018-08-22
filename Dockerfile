FROM ubuntu:16.04
#Use http://pkg.mxe.cc/
#First add the repository and install the static gcc compiler. This ensures that everything basic is setup.

RUN echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" > /etc/apt/sources.list.d/mxeapt.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
RUN apt-get update && apt-get upgrade

RUN apt-get install -yy autoconf automake autopoint bash bison bzip2 flex g++ g++-multilib gettext git gperf intltool libc6-dev-i386 libgdk-pixbuf2.0-dev libltdl-dev libssl-dev libtool-bin libxml-parser-perl make openssl p7zip-full patch perl pkg-config python ruby scons sed unzip wget xz-utils
RUN apt-get install -yy mxe-x86-64-w64-mingw32.static-boost
RUN whereis mxe
RUN cd /usr/bin && rm cmake cpack
RUN ln -s /usr/lib/mxe/usr/bin/x86_64-w64-mingw32.static-cmake cmake
RUN ln -s /usr/lib/mxe/usr/bin/x86_64-w64-mingw32.static-cpack cpack

ENV PATH="/usr/lib/mxe/usr/bin:${PATH}"
