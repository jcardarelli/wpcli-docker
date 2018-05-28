FROM php:7.0
RUN apt-get -qq update && apt-get install -y less

ARG wp_url
ARG wp_title
ARG wp_admin_user
ARG wp_admin_pass
ARG wp_admin_email

RUN groupadd wordpress
RUN useradd -r -u 1001 -g wordpress wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

USER wordpress
RUN wp --info

RUN wp core install --url=${wp_url} --title=${wp_title} --admin_user=${wp_admin_user} \
    --admin_password=${admin_password} --admin_email=${admin_email}

ENTRYPOINT ["wp"]
CMD ["--help"]
