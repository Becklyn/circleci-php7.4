FROM circleci/php:7.4-browsers

RUN sudo -E apt-get update && \
    sudo -E apt-get install -y libmagickwand-dev --no-install-recommends && \
    sudo -E pecl install imagick && \
    sudo -E docker-php-ext-enable imagick

RUN sudo -E apt-get update && \
    sudo -E apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev && \
    sudo -E docker-php-ext-install bcmath && \
    sudo -E docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
    sudo -E docker-php-ext-install gd

RUN sudo -E docker-php-ext-install pdo_mysql mysqli && \
    sudo -E docker-php-ext-enable pdo_mysql mysqli

RUN sudo -E docker-php-ext-install pdo_mysql mysqli && \
    sudo -E docker-php-ext-enable pdo_mysql mysqli

RUN sudo -E curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash - && \
    sudo -E apt-get install -y nodejs build-essential && \
    sudo -E npm i -g npm node-gyp

RUN sudo -E -- sh -c 'touch /usr/local/etc/php/conf.d/docker-php-memlimit.ini; echo "memory_limit = -1" >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini'
