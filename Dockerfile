##
# \file Dockerfile
# \brief Dockerfile to build polytech builder
# \author Jeremy HERGAULT (reneca), Anthony THOMAS
# \version 1.0
# \date 2022-10-13
#
# This file is part of PolyBuilder, which is builder for overware programs.
# Copyright (C) 2022  HERGAULT Jeremy, Alexandre, Thierry ( reneca )
#
# PolyBuilder is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# PolyBuilder is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with OVCloud. If not, see <http://www.gnu.org/licenses/>.
##
FROM debian:stable
LABEL Description="PolyBuilder for Polytech programs" Maintainer="Jeremy HERGAULT, Anthony THOMAS" Vendor="overware" Version="1.0"

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get -y update && apt-get -y install \
      openssl \
      ca-certificates \
      procps \
      wget \
      curl \
      build-essential \
      vim \
      git \
      make \
      gcc \
      g++ \
      gdb \
      libc-dbg \
      openjdk-11-jdk \
      maven \
      python3-pip \
 && apt-get -y clean && apt-get -y autoclean \
 && mkdir -p /opt \
 && pip3 install prometheus-client

WORKDIR /opt

VOLUME /opt/
