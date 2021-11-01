FROM python:3.9
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get install -y vim less libboost-dev swig build-essential cmake git
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install setuptools pandas numpy matplotlib jupyterlab dwave-ocean-sdk

RUN mkdir /home/work
WORKDIR /home/work

RUN git clone https://github.com/MasahitoKumada/traffic-signals-qubo.git

WORKDIR /home/work/traffic-signals-qubo
RUN git checkout kmd

CMD ["/bin/bash"]