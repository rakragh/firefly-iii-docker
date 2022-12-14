FROM fireflyiii/base:apache-8.1

# For more information about fireflyiii/base visit https://dev.azure.com/firefly-iii/BaseImage

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
COPY ./entrypoint-fpm.sh /usr/local/bin/entrypoint-fpm.sh
COPY ./counter.txt /var/www/counter-main.txt
COPY ./date.txt /var/www/build-date-main.txt
COPY ./alerts.json /var/www/html/resources/alerts.json

RUN curl -SL https://github.com/rakragh/firefly-iii/archive/5.7.12-fork.tar.gz | tar xzC $FIREFLY_III_PATH --strip-components 1 && \
    chmod -R 775 $FIREFLY_III_PATH/storage && \
    composer install --prefer-dist --no-dev --no-scripts && /usr/local/bin/finalize-image.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
