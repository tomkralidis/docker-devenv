FROM python:2.7-slim

# install commonly used dependencies

RUN apt-get update && apt-get install -y gcc libgeos-dev libpq-dev \
    libxml2-dev libxslt1-dev libz-dev vim git python-virtualenv

RUN useradd -ms /bin/bash tkralidi

USER tkralidi
WORKDIR /home/tkralidi

# setup dotfiles

RUN git clone git://github.com/tomkralidis/dotfiles.git
WORKDIR dotfiles
RUN bash -f ./install.sh
WORKDIR ..
RUN bash -c "source .bash_profile"
