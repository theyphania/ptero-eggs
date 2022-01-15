FROM ubuntu:20.04

RUN apt update && apt install sudo software-properties-common ca-certificates nginx -y
RUN LC_ALL=C.UTF-8.0 add-apt-repository -y ppa:ondrej/php
RUN apt update && apt upgrade -y  && apt install php8.0 php8.0-common php8.0-fpm php8.0-soap php8.0-gmp php8.0-dom php8.0-pdo php8.0-zip php8.0-mysqli php8.0-sqlite3 php8.0-bcmath php8.0-gd php8.0-odbc php8.0-gettext php8.0-xmlreader php8.0-bz2 php8.0-iconv php8.0-curl php8.0-ctype php8.0-phar php8.0-fileinfo php8.0-mbstring php8.0-tokenizer -y

RUN apt install php8.0-xml php8.0-simplexml php8.0-xmlwriter -y

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
