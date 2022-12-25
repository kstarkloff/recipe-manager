FROM ubuntu:latest

#
# install all relevant packages and enable php extensions
#
RUN apt update -y && \
    apt upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt install software-properties-common -y && \
    add-apt-repository ppa:ondrej/php -y && apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y curl unzip p7zip-full ldap-utils nano \
        php8.1 php8.1-mysql php8.1-xml php8.1-bcmath php8.1-gd php8.1-imagick php8.1-mbstring php8.1-curl php8.1-zip php8.1-intl php8.1-ldap && \
    phpenmod mysqli

WORKDIR /root

#
# install composer
#
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer

#
# install nodejs
#
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt -y install nodejs

WORKDIR /var/www/html

EXPOSE 8000

# RUN cd /var/www/html && php artisan key:generate && php artisan config:cache

CMD [ "php", "artisan", "serve", "--host", "0.0.0.0" ]