#!/bin/bash -x

echo "Parando o Wildfly"
/bin/systemctl stop wildfly

sleep 10

echo "Parando o Asterisk"
/bin/systemctl stop asterisk

sleep 10

echo "Parando Postgres"
/bin/systemctl stop postgresql-11

sleep 10

echo "Parando MariaDB"
/bin/systemctl stop mariadb

sleep 10

echo "Limpando cache da memoria"
/bin/sync
sysctl vm.drop_caches=3

sleep 10

echo "Limpando swap"
/usr/sbin/swapoff -a

sleep 10

/usr/sbin/swapon -a

sleep 10

echo "Iniciando MariaDB"
/bin/systemctl start mariadb

sleep 10

echo "Iniciando postgres"
/bin/systemctl start postgresql-11

sleep 10

echo "Iniciando Asterisk"
/bin/systemctl start asterisk

sleep 10

echo "Iniciando Wildfly"
/bin/systemctl start wildfly