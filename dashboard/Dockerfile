FROM ubuntu:21.04

ENV TZ=UTC

EXPOSE 80

VOLUME /var/www/html

WORKDIR /var/www/html

# System packages
RUN apt update \
  && apt install -y \
    software-properties-common \
  && add-apt-repository -y ppa:ondrej/php \
  && apt install -y \
    php8.1-fpm \
    php8.1-curl \
    php8.1-dom

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer

# todo: merge bottom RUN calls with top RUN calls
RUN apt install -y git php8.1-zip unzip

# NPM
RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt install -y nodejs

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt update \
    && apt install -y yarn

ENTRYPOINT ["/usr/bin/bash"]
