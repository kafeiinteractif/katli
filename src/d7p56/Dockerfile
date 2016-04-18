# from https://www.drupal.org/requirements/php#drupalversions
FROM php:5.6-apache

RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev mysql-client \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring opcache pdo pdo_mysql pdo_pgsql zip

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN { echo 'memory_limit=256M'; } > /usr/local/etc/php/php.ini

WORKDIR /var/www/html

RUN curl http://files.drush.org/drush.phar -o drush.phar
RUN php drush.phar core-status
RUN chmod +x drush.phar
RUN mv drush.phar /usr/local/bin/drush

RUN curl https://drupalconsole.com/installer -L -o drupal.phar
RUN chmod +x drupal.phar
RUN mv drupal.phar /usr/local/bin/drupal
RUN drupal init --override
RUN drupal check
