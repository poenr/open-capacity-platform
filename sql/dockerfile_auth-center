FROM mysql:5.7.26
ADD auth-center-my.cnf /etc/mysql/conf.d/my.cnf
ADD 02.oauth-center.sql /docker-entrypoint-initdb.d/02.oauth-center.sql
EXPOSE 3306
