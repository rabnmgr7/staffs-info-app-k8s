FROM mysql:latest
RUN { \
        echo '[mysqld]'; \
        echo 'default_authentication_plugin=mysql_native_password'; \
    } > /etc/mysql/conf.d/docker.cnf
EXPOSE 3306

ADD setup.sql /docker-entrypoint-initdb.d
