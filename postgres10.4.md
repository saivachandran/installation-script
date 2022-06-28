PostgreSQL (10.4 (Ubuntu 10.4-2.pgdg16.04+1)) Ubuntu 16.04.4 LTS

##### Installation 

https://www.postgresql.org/download/linux/ubuntu/

Create the file /etc/apt/sources.list.d/pgdg.list and add a line for the repository

```deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main```

Import the repository signing key

```wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -```

and update the package lists

```sudo apt-get update```


```apt-get install postgresql-10```


	###### INCLUDED IN DISTRIBUTION
	###### postgresql-client-10,postgresql-10,postgresql-contrib-9.x,postgresql-xx,libpq-dev,
	###### postgresql-server-dev-10,pgadmin4


#### Creating user

```$ sudo -u postgres createuser <username>```

#### Creating Database

```$ sudo -u postgres createdb <dbname>```

#### Giving the user a password

```
$ sudo -u postgres psql
psql=# alter user <username> with encrypted password '<password>';
```
####  Granting privileges on database

```psql=# grant all privileges on database <dbname> to <username> ;```

####  Commands

 * \list or \l: list all databases
 * \dt: list all tables in the current database
You will never see tables in other databases, these tables aren't visible. You have to connect to the correct database to see its tables (and other objects).
 * \connect <database_name> # To switch databases:


####  How to manage PostgreSQL databases and users from the command line
https://www.a2hosting.in/kb/developer-corner/postgresql/managing-postgresql-databases-and-users-from-the-command-line

####  HELPFULL 
	
	create role <role_name> with createdb login;
	create role <role_name> with createdb login password '<password>';
	\password <role_name>
	\du # list Role name and  List of roles Attributes 
--Create User

	CREATE USER my_user_test WITH LOGIN NOSUPERUSER NOCREATEDB  NOCREATEROLE    INHERIT NOREPLICATION   CONNECTION LIMIT -1 PASSWORD 'xxxxxxx';

-- Grant connect to my data base

	GRANT CONNECT ON DATABASE my_db_test TO my_user_test;

-- Grant usage the schema

	GRANT USAGE ON SCHEMA my_sch_test TO my_user_test ;

-- Grant all table for SELECT, INSERT, UPDATE, DELETE

	GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA my_sch_test TO my_user_test;


#### Use systemctl command to manage postgresql service:

	systemctl stop postgresql #stop service

	systemctl start postgresql #start service

	systemctl status postgresql #show status of service:

	systemctl disable postgresql # disable service(not auto-start any more)

	enable service postgresql(auto-start)

	systemctl enable postgresql
