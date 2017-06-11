FROM python:2.7-slim

# install commonly used dependencies

RUN apt-get update && apt-get install -y gcc libgeos-dev libpq-dev \
    libxml2-dev libxslt1-dev libz-dev vim git python-virtualenv

# setup dotfiles

RUN git clone git://github.com/tomkralidis/dotfiles.git && cd dotfiles/ && \
    bash -f ./install.sh && bash -c "source $HOME/.bash_profile"

