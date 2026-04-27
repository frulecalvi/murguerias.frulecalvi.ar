FROM wordpress:6.9.4-php8.4-apache
WORKDIR /usr/src/wordpress
RUN set -eux; \
	find /etc/apache2 -name '*.conf' -type f -exec sed -ri -e "s!/var/www/html!$PWD!g" -e "s!Directory /var/www/!Directory $PWD!g" '{}' +; \
	cp -s wp-config-docker.php wp-config.php
COPY varia-theme/ ./wp-content/themes/varia-theme/
COPY balasana-theme/ ./wp-content/themes/balasana-theme/
