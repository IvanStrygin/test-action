FROM php:8.1.12-fpm-alpine3.15 AS base
ARG GITHUB_OAUTH_TOKEN
WORKDIR /var/www/backend
#ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
COPY composer /usr/bin/
RUN apk update && apk upgrade \
  && apk add --no-cache git openssh \
  && chown -R www-data:www-data /var/www/backend

USER www-data
RUN composer config -g github-oauth.github.com ${GITHUB_OAUTH_TOKEN}

