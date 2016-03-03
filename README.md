# mysql
A small image with mysql, mysql-client cli and bash using Alpine 3.3.  Optimized for low memory (512MB) installations.

## get started
```bash
# root/empty password
docker run --name="mysql" -v /data/mysql:/app --restart="always" -d grgichtran/mysql
```
## using mysql cli
```bash
# get bash inside container
docker exec -it mysql bash
# container bash
$ mysql -u root -p
```

## changing root password
```bash
# get bash inside container
docker exec -it mysql bash
# container bash
$ mysql -u root -p
# execute this
USE mysql;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
UPDATE user SET password=PASSWORD("new-root-password") WHERE User='root';
FLUSH PRIVILEGES;
quit;
```

## configure my.conf
```bash
# copy file out of container
docker cp mysql:/etc/mysql/my.cnf .
# edit
vi  my.conf
# copy file back into container
docker cp my.cnf mysql:/etc/mysql/my.cnf
```
