#!/usr/bin/env bash

#php -d memory_limit=-1 /usr/local/bin/composer -V

php -d memory_limit=-1 /usr/local/bin/composer create-project --repository-url=https://repo.magento.com/ magento/project-enterprise-edition ./magento/

php -d memory_limit=-1 /var/www/html/magento/bin/magento setup:install --base-url=https://dev.magento2.docker/ \
--db-host=db --db-name=magento --db-user=magento --db-password=magento \
--admin-firstname=Admin --admin-lastname=User --admin-email=admin.user@demo.com \
--admin-user=admin --admin-password=admin123 --language=en_US \
--currency=USD --timezone=America/Chicago --use-rewrites=1 \
--search-engine=elasticsearch7 --elasticsearch-host=elasticsearch \
--elasticsearch-port=9200

php -d memory_limit=-1 /var/www/html/magento/bin/magento sampledata:deploy
php -d memory_limit=-1 /var/www/html/magento/bin/magento indexer:reindex
php -d memory_limit=-1 /var/www/html/magento/bin/magento cache:flush
