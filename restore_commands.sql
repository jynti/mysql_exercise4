--creating backup in command line
mysqldump -u root -p DVDRentals > ~/database/backup_exercise4_100118.sql
----------------------------------
mysql> CREATE DATABASE restored;
Query OK, 1 row affected (0.00 sec)

mysql> USE restored;
Database changed

--restoring backup using mysql client utility in interactive mode
mysql> source ~/database/backup_exercise4_100118.sql

--restoring backup using command line
mysql -u root -p restored < ~/database/backup_exercise4_100118.sql
