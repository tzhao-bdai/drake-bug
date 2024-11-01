FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 7000-7099/tcp
EXPOSE 8888/tcp

RUN apt-get update \
      && apt-get install --no-install-recommends -qy curl apt-transport-https \
      sudo ca-certificates libgtest-dev libgflags-dev patchelf python3.10-dev  \
      python3-pip git python-is-python3 libyaml-cpp-dev clang xvfb vim \
      && rm -rf /var/lib/apt/lists/* \
      && apt-get clean all

RUN pip3 install auditwheel sphinx exhale

# Drake
ENV DRAKE_URL=https://github.com/RobotLocomotion/drake/releases/download/v1.26.0/drake-1.26.0-jammy.tar.gz
RUN curl -fSL -o drake.tar.gz $DRAKE_URL
RUN tar -xzf drake.tar.gz -C /opt && rm drake.tar.gz
RUN apt-get update \
  && yes "Y" | bash /opt/drake/share/drake/setup/install_prereqs \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean all
ENV DRAKE_INSTALL_PATH=/opt/drake

ENV PYTHONPATH $DRAKE_INSTALL_PATH/lib/python3.10/site-packages:$PYTHONPATH

