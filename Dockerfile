FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ Europe/Rome
ENV LANG it_IT.UTF-8
ENV LANGUAGE it_IT:it
ENV LC_ALL it_IT.UTF-8

RUN apt-get update \
    && apt-get install -y apt-utils locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i it_IT -c -f UTF-8 -A /usr/share/locale/locale.alias it_IT.UTF-8

RUN apt-get update \
    && apt-get install -yq tzdata \
    && ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

CMD ["/bin/bash"] 
