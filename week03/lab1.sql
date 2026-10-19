powershell
PS C:\Users\HP> mysql -u root -p
Enter password: **********
Welcome to the MySQL monitor. Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 9.6.0 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE morenikeji_david_olowo;
Query OK, 1 row affected (0.234 sec)

mysql> DROP DATABASE morenikeji_david_olowo;
Query OK, 0 rows affected (0.329 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| node-complete      |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.030 sec)

mysql> CREATE DATABASE SEN_307_11362;
Query OK, 1 row affected (0.183 sec)

mysql> USE SEN_307_11362;
Database changed

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| node-complete      |
| performance_schema |
| sen_307_11362      |
| sys                |
+--------------------+
6 rows in set (0.029 sec)

mysql> SELECT DATABASE();
+---------------+
| DATABASE()    |
+---------------+
| sen_307_11362 |
+---------------+
1 row in set (0.011 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| node-complete      |
| performance_schema |
| sen_307_11362      |
| sys                |
+--------------------+
6 rows in set (0.026 sec)

mysql> SELECT VERSION();
+-----------+
| VERSION() |
+-----------+
| 9.6.0     |
+-----------+
1 row in set (0.013 sec)

mysql> SELECT CURRENT_USER();
+----------------+
| CURRENT_USER() |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.013 sec)

mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2026-10-19 15:05:58 |
+---------------------+
1 row in set (0.013 sec)

mysql> STATUS
--------------
C:\Program Files\MySQL\MySQL Server 9.6\bin\mysql.exe  Ver 9.6.0 for Win64 on x86_64 (MySQL Community Server - GPL)

Connection id:          10
Current database:       sen_307_11362
Current user:           root@localhost
SSL:                    Cipher in use is TLS_AES_128_GCM_SHA256
Using delimiter:        ;
Server version:         9.6.0 MySQL Community Server - GPL
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    cp850
TCP port:               3306
Binary data as:         Hexadecimal
Uptime:                 17 min 54 sec

Threads: 4  Questions: 82  Slow queries: 0  Opens: 208  Flush tables: 3  Open tables: 127  Queries per second avg: 0.076
--------------

mysql> SHOW VARIABLES LIKE 'port';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| port          | 3306  |
+---------------+-------+
1 row in set (0.068 sec)

mysql> SHOW TABLES;
Empty set (0.042 sec)
