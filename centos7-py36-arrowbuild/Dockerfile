FROM centos/python-36-centos7:latest 

MAINTAINER Ryan White <ryanmackenziewhitephd@gmail.com>

USER root
RUN mkdir /work
ENV WORKDIR=/work
RUN yum -y install git
RUN yum -y groupinstall 'Development Tools'
RUN yum -y install jemalloc cmake boost-devel
RUN mkdir -p /tmp/cmake && \
    pushd /tmp/cmake && \
    wget 'https://cmake.org/files/v3.9/cmake-3.9.1-Linux-x86_64.sh' && \
    bash cmake-3.9.1-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir  && \
    popd && \
    rm -rf /tmp/cmake
RUN mkdir $WORKDIR/repos && \
    cd $WORKDIR/repos && \
    git clone https://github.com/apache/arrow.git 
RUN mkdir $WORKDIR/repos/pyarrow 
RUN pip install --upgrade pip
RUN pip install six numpy pandas cython pytest hypothesis
RUN mkdir $WORKDIR/repos/dist 
ENV ARROW_BUILD_TYPE=release 
ENV ARROW_HOME=$WORKDIR/repos/dist
ENV PARQUET_HOME=$WORKDIR/repos/dist
ENV LD_LIBRARY_PATH=$WORKDIR/repos/dist/lib:$LD_LIBRARY_PATH
RUN mkdir $WORKDIR/repos/arrow/cpp/build 
RUN pushd $WORKDIR/repos/arrow/cpp/build; cmake -DCMAKE_BUILD_TYPE=$ARROW_BUILD_TYPE -DCMAKE_INSTALL_PREFIX=$ARROW_HOME -DCMAKE_INSTALL_LIBDIR=lib -DARROW_PYTHON=on -DARROW_BUILD_TESTS=OFF ..; make -j4; make install; popd
RUN cd $WORKDIR/repos/arrow/python && \
    python setup.py build_ext --build-type=$ARROW_BUILD_TYPE --inplace && \
    py.test pyarrow
