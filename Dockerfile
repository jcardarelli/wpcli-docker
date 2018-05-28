FROM php:7.0
RUN apt-get -qq update && apt-get install -y less

RUN groupadd wordpress
RUN useradd -r -u 1001 -g wordpress wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

USER wordpress
RUN wp --info

ENTRYPOINT ["wp"]
CMD ["--help"]
