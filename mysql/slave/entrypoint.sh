#!/bin/bash

/usr/local/bin/docker-entrypoint.sh mysqld &

until mysqladmin -u root -prootpass ping; do
  sleep 1
done

until mysql -h mysql_master -u root -prootpass -e 'SELECT 1'; do
  sleep 1
done

MASTER_STATUS=$(mysql -h mysql_master -u root -prootpass -e "SHOW MASTER STATUS" --silent --skip-column-names)
LOG_FILE=$(echo "$MASTER_STATUS" | awk '{print $1}')
LOG_POS=$(echo "$MASTER_STATUS" | awk '{print $2}')

mysql -u root -prootpass -e "CHANGE MASTER TO
  MASTER_HOST='mysql_master',
  MASTER_USER='repl',
  MASTER_PASSWORD='replpass',
  MASTER_LOG_FILE='$LOG_FILE',
  MASTER_LOG_POS=$LOG_POS;
START SLAVE;"

wait