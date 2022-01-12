FROM ubuntu:21.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

EXPOSE 80

VOLUME /var/www/html

WORKDIR /var/www/html

# System packages
RUN apt update \
  && apt install -y \
    curl \
    git \
    software-properties-common \
    unzip \
  && add-apt-repository -y ppa:ondrej/php \
  && apt install -y \
    php8.1-cli \
    php8.1-curl \
    php8.1-dom \
    php8.1-zip

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer

# NPM
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt install -y nodejs

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt update \
    && apt install -y yarn

# Cleanup
#RUN apt purge -y software-properties-common \
#    && apt -y autoremove \
#    && apt clean

ENTRYPOINT ["bash", "bin/entrypoint.sh"]
