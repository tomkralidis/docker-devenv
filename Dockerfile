FROM python:3.6-slim

# install commonly used dependencies

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y locales

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get install -y gcc libgeos-dev libpq-dev \
    libxml2-dev libxslt1-dev libz-dev vim git python3-virtualenv make \
    git-core bash-completion

RUN apt-get install -y postgresql postgresql-contrib postgis \
    python-software-properties software-properties-common redis-server \
    rabbitmq-server

RUN echo "host all  all    0.0.0.0/0  trust" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN service postgresql start


RUN useradd -ms /bin/bash tkralidi

USER tkralidi
WORKDIR /home/tkralidi

EXPOSE 5432
EXPOSE 5672
EXPOSE 6379

# setup dotfiles

RUN git clone git://github.com/tomkralidis/dotfiles.git
WORKDIR dotfiles
RUN bash -f ./install.sh
WORKDIR ..
RUN bash -c "source .bash_profile"
