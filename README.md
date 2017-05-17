Реєструємося на github:
git2usr:MH9aGLIJ

Наш шлях проекту:
https://github.com/git2usr/interlink.git


На хості встановлюємо пакети: 
apt-get install docker-engine -y

Запускаємо службу:
sudo systemctl start docker

Автостарт при загрузці ОС:
sudo systemctl enable docker

перевіряємо статус:
systemctl status docker

Встановлюємо пакети git та bash
apt-get install git
apt-get install bash

2. Делаем git clone предоставленного репозитория
vlymar@voip-srv:~$ git clone https://github.com/git2usr/interlink.git


  - запустить MySQL сервис в качестве docker container с возможностью доступа с других хостов:
Добавляємо локального користувача vlymar  в групу docker, для роботи з docker з під vlymar:
sudo usermod -aG docker vlymar

Всі інші команди виконуємо з під користувача vlymar:

Створюємо будь-який каталог, наприклад docker-mysql.
mkdir -p /home/vlymar/docker-mysql
В якому створюэмо файл Dockerfile, в якому описуємо яку базову ОС ми хотіли б встановити:
$cat > Dockerfile
FROM ubuntu:14.04
RUN apt-get update && apt-get install -y mysql-server


в цоьму ж каталозі виконуємо:
$docker build .
й чекаємо доки встановлення закінчиться.

Після встановлення образу, присвоїмо мітки для образу 1: private/mysql , та для образу 2: private/mysql2.

1:
vlymar@voip-srv:~/docker-mysql1$ docker build --tag=private/mysql .
Sending build context to Docker daemon  20.99kB
Step 1/2 : FROM ubuntu:14.04
 ---> 2ff3b426bbaa
Step 2/2 : RUN apt-get update && apt-get install -y mysql-server
 ---> Using cache
 ---> 6f0443558b15
Successfully built 6f0443558b15
Successfully tagged private/mysql:latest

2:
vlymar@voip-srv:~/docker-mysql2$ docker build --tag=private/mysql2 .
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM ubuntu:14.04
 ---> 2ff3b426bbaa
Step 2/2 : RUN apt-get update && apt-get install -y mysql-server
 ---> Using cache
 ---> 6f0443558b15
Successfully built 6f0443558b15
Successfully tagged private/mysql2:latest


Спробуємо зайти в ці контейнери в інтерактивному режимі:
docker run -i -t --rm private/mysql bash
docker run -i -t --rm private/mysql2 bash

так як контейнер працює в режимі -ro тільки читання й всі зміни що ми внесемо в контейнер не збережуться, створимо на хост-машині каталоги для локального зберігання БД:
mkdir -p /home/vlymar/docker-volumes/mysql-data1
mkdir -p  /home/vlymar/docker-volumes/mysql-data2

Примонтуємо том з даними до контейнера 1:
docker run -i -t --rm -v /home/vlymar/docker-volumes/mysql-data1:/var/lib/mysql private/mysql bash



й до контейнера 2:
docker run -i -t --rm -v /home/vlymar/docker-volumes/mysql-data2:/var/lib/mysql private/mysql2 bash


також виконав, пункти з статті https://blog.amartynov.ru/docker-mysql/
Инициализация содержимого /var/lib/mysql
Старт MySQL-сервера и подключение к нему

Далі запуск контейнера в фоні:
1. docker run -v /home/vlymar/docker-volumes/mysql-data1:/var/lib/mysql -p 172.17.0.1:3306:3306 -d private/mysql

Підключаємося mysql сервера контейнера 1:
docker exec -i -t mysql1 mysql

Створюємо БД db1
mysql> create database db1;
Надамо права користувачу user1  для цієї бази та задамо пароль:
grant all privileges on db1.* to user1@'%' identified by '1qazxsw2';

Тепер можемо зайти так:
docker exec -i -t 5290c997b6d4 mysql -u user1 -p
Enter password:

Перевіримо вхід через мережевий інтерфейс:
mysql -h 172.17.0.1 -u user1 -p

Перевіримо наявні бази:
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| db1                |
+--------------------+
2 rows in set (0.00 sec)

Вхід в db1:
> use db1;
  


 - наполнить базу какими-нибудь данными:

Згенеруємо довільну таблицю в базі: http://www.generatedata.com/

DROP TABLE `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `phone` varchar(100) default NULL,
  `date` varchar(255),
  `company` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`name`,`phone`,`date`,`company`) VALUES ("Jack","(037) 38686911","Jul 9, 2016","Mus Proin Vel Foundation"),("Cairo","(0883) 13242084","Jul 12, 2017","Volutpat PC"),("Finn","(07719) 0472688","Jun 10, 2016","Tincidunt Consulting"),("Ian","(0886) 67477777","Jan 27, 2018","Aliquam LLC"),("Hunter","(09505) 3682514","Sep 29, 2017","Ad Litora Torquent Limited"),("Davis","(040) 16281714","Feb 7, 2018","Eleifend Nunc Corporation"),("Zachery","(035547) 965290","Mar 13, 2018","Nisl Elementum Institute"),("Barry","(031465) 392771","Aug 22, 2016","Gravida Sagittis Duis Limited"),("Blaze","(0880) 42729507","Jul 2, 2016","Leo Elementum Ltd"),("Garrison","(0336) 78805619","Nov 25, 2016","Quis Turpis Vitae Inc.");
INSERT INTO `myTable` (`name`,`phone`,`date`,`company`) VALUES ("Davis","(0538) 12208109","Sep 8, 2017","Pellentesque LLP"),("Kaseem","(069) 30169372","Jan 14, 2018","Neque Nullam Nisl Inc."),("Joel","(057) 96903314","Sep 24, 2016","Euismod Et Associates"),("Aristotle","(0405) 96318609","Dec 17, 2016","Risus Donec Egestas Foundation"),("Yardley","(0081) 87756106","Mar 2, 2017","Consectetuer LLC"),("Kibo","(0885) 09989917","Feb 22, 2018","Lobortis Class Aptent Consulting"),("Lars","(00918) 3482387","Apr 24, 2017","Elit Erat Vitae Institute"),("Ulysses","(04445) 1994414","Feb 21, 2017","Nec Tellus PC"),("Chester","(040) 14349009","Nov 10, 2017","Eu Foundation"),("Daquan","(0924) 06152403","Apr 15, 2017","Feugiat Lorem Ltd");
…….


Переглянемо дані в таблиці:
mysql> SHOW TABLES;
+---------------+
| Tables_in_db1 |
+---------------+
| myTable       |
+---------------+
1 row in set (0.00 sec)


mysql>  SELECT * FROM myTable;  
+-----+------------+-----------------+--------------+----------------------------------------+
| id  | name       | phone           | date         | company                                |
+-----+------------+-----------------+--------------+----------------------------------------+
|   1 | Jack       | (037) 38686911  | Jul 9, 2016  | Mus Proin Vel Foundation               |
|   2 | Cairo      | (0883) 13242084 | Jul 12, 2017 | Volutpat PC                            |
|   3 | Finn       | (07719) 0472688 | Jun 10, 2016 | Tincidunt Consulting                   |
|   4 | Ian        | (0886) 67477777 | Jan 27, 2018 | Aliquam LLC                            |
|   5 | Hunter     | (09505) 3682514 | Sep 29, 2017 | Ad Litora Torquent Limited             |
|   6 | Davis      | (040) 16281714  | Feb 7, 2018  | Eleifend Nunc Corporation              |
|   7 | Zachery    | (035547) 965290 | Mar 13, 2018 | Nisl Elementum Institute               |
|   8 | Barry      | (031465) 392771 | Aug 22, 2016 | Gravida Sagittis Duis Limited          |
|   9 | Blaze      | (0880) 42729507 | Jul 2, 2016  | Leo Elementum Ltd                      |
|  10 | Garrison   | (0336) 78805619 | Nov 25, 2016 | Quis Turpis Vitae Inc.                 |


   - сделать бекап базы:

Робимо бекап бази db1 з першого контейнера:
vlymar@voip-srv:~/docker-mysql$ docker exec -i -t a7969acb8e5b bash
root@a7969acb8e5b:/# mysqldump -u user1 -p db1 > /var/lib/mysql/dump_db1.sql

Файл буде знаходитися в /home/vlymar/docker-volumes/mysql-data1/dump_db1.sql на мойому хості.


   - "залить" бекап в репозиторий:
Перемісмо бекап в /home/vlymar/interlink/:
mv /home/vlymar/docker-volumes/mysql-data1/dump_db1.sql /home/vlymar/interlink/

Дивимося статус та добавимо файл в репозитарій:

root@voip-srv:/home/vlymar/interlink# git status
On branch master
Your branch is up-to-date with 'origin/master'.
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        dump_db1.sql

root@voip-srv:/home/vlymar/interlink# git add dump_db1.sql
root@voip-srv:/home/vlymar/interlink# git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
        new file:   dump_db1.sql

Робимо комміт того що проіндексували:
root@voip-srv:/home/vlymar/interlink# git commit -a -m "db"

Відправляємо зміни на github:
root@voip-srv:/home/vlymar/interlink# git push


  - запустить второй MySQL сервис в качестве docker container с возможностью доступа с других хостов:

 docker run -v /home/vlymar/docker-volumes/mysql-data2:/var/lib/mysql -p 172.17.0.1:3306:3306 -d private/mysql2

Підключаємося mysql сервера контейнера 2:
docker exec -i -t mysql2 mysql


Створюємо БД db2
mysql> create database db2;
Надамо права користувачу user2  для цієї бази та задамо пароль:
grant all privileges on db2.* to user2@'%' identified by '2wsxzaq1';


mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)

mysql> create database db2;
Query OK, 1 row affected (0.00 sec)

mysql> grant all privileges on db2.* to user2@'%' identified by '2wsxzaq1';
Query OK, 0 rows affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| db2                |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.01 sec)

Тепер можемо зайти так:
docker exec -i -t 456f387e5389 mysql -u user1 -p
Enter password:

Перевіримо вхід через мережевий інтерфейс:
vlymar@voip-srv:~/docker-mysql$ mysql -h 172.17.0.1 -u user2 -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.5.55-0ubuntu0.14.04.1 (Ubuntu)

Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>

   - наполнить его данными из бекапа:
Скопіюємо дамп бекапа бази в /home/vlymar/docker-volumes/mysql-data2/ для доступу з  контейнера 2.
$cp /home/vlymar/interlink/dump_db1.sql /home/vlymar/docker-volumes/mysql-data2/

Заходимо в контейнер й робимо імпорт в db2 з файла бекапу:
root@456f387e5389:/# mysql --user=user2 --password=2wsxzaq1 --database=db2 < /var/lib/mysql/dump_db1.sql

Інформація про те, що все вдало імпортовано в db2:
root@456f387e5389:/# mysql -u user2 -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 6
Server version: 5.5.55-0ubuntu0.14.04.1 (Ubuntu)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| db2                |
+--------------------+
2 rows in set (0.00 sec)

mysql> use db2
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql>
mysql>  SHOW TABLES;
+---------------+
| Tables_in_db2 |
+---------------+
| myTable       |
+---------------+
1 row in set (0.01 sec)

mysql>
mysql> SELECT * FROM myTable;   
+-----+------------+-----------------+--------------+----------------------------------------+
| id  | name       | phone           | date         | company                                |
+-----+------------+-----------------+--------------+----------------------------------------+
|   1 | Jack       | (037) 38686911  | Jul 9, 2016  | Mus Proin Vel Foundation               |
|   2 | Cairo      | (0883) 13242084 | Jul 12, 2017 | Volutpat PC                            |
|   3 | Finn       | (07719) 0472688 | Jun 10, 2016 | Tincidunt Consulting                   |
|   4 | Ian        | (0886) 67477777 | Jan 27, 2018 | Aliquam LLC                            |
|   5 | Hunter     | (09505) 3682514 | Sep 29, 2017 | Ad Litora Torquent Limited             |
|   6 | Davis      | (040) 16281714  | Feb 7, 2018  | Eleifend Nunc Corporation              |
|   7 | Zachery    | (035547) 965290 | Mar 13, 2018 | Nisl Elementum Institute               |
|   8 | Barry      | (031465) 392771 | Aug 22, 2016 | Gravida Sagittis Duis Limited          |
|   9 | Blaze      | (0880) 42729507 | Jul 2, 2016  | Leo Elementum Ltd                      |
|  10 | Garrison   | (0336) 78805619 | Nov 25, 2016 | Quis Turpis Vitae Inc.                 |
|  11 | Logan      | (036544) 165003 | Oct 6, 2017  | Dictum Sapien Limited                  |







