FROM php:7.0
RUN apt-get -qq update && apt-get install -y less

ARG wp_url
ARG wp_title
ARG wp_admin_user
ARG wp_admin_pass
ARG wp_admin_email
ARG wp_dir
ARG wp_user
ARG wp_group
ARG wp_db_user
ARG wp_db_name

RUN groupadd ${wp_group}
RUN useradd -r -u 1001 -g ${wp_group} ${wp_user}

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p ${wp_dir}
RUN mkdir -p /home/${wp_user}
RUN chown -R ${wp_user}:${wp_group} ${wp_dir}
RUN chown -R ${wp_user}:${wp_group} /home/${wp_user}

USER wordpress
RUN wp core download --path=${wp_dir}
#RUN wp config create --path=${wp_dir} --dbuser=${wp_db_user} --dbname=${wp_db_name}
#RUN wp core install --url=${wp_url} --title=${wp_title} --admin_user=${wp_admin_user} \
    #--admin_password=${wp_admin_pass} --admin_email=${wp_admin_email} --path=${wp_dir}

ENTRYPOINT ["wp"]
CMD ["--help"]
