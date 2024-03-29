# Add Official Repository

# You may want to install PostgreSQL from an official repository, since it is updated more frequently than official Ubuntu sources.

# First, you should install prerequisite software packages that will be used to download and install software certificates for a secure SSL connection.

sudo apt install wget ca-certificates

# Then, get the certificate, add it to apt-key management utility and create a new configuration file with an official PostgreSQL repository address inside.

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'


# Introduction

# PostgreSQL is a fully featured database management system (DBMS) with a strong emphasis on extensibility and SQL compliance. It is backed by 20 years of open-source development, and supports both SQL (relational) and JSON (non-relational) querying.

# PostgreSQL is one of the most popular databases in the industry that is used for various web, mobile and analytics applications. Let‘s now go through a step-by-step guide of how to install and setup PostgreSQL on your Ubuntu 20.04 machine.

Add Official Repository

You may want to install PostgreSQL from an official repository, since it is updated more frequently than official Ubuntu sources.

# First, you should install prerequisite software packages that will be used to download and install software certificates for a secure SSL connection.

sudo apt install wget ca-certificates

# Then, get the certificate, add it to apt-key management utility and create a new configuration file with an official PostgreSQL repository address inside.

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

# Install PostgreSQL

# It is always a good idea to download information about all packages available for installation from your configured sources before the actual installation.

sudo apt update

# Now is the time to do the actual PostgreSQL installation. This will install the latest PostgreSQL version along with the newest extensions and additions that are not yet officially part of the PostgreSQL core.

apt install postgresql postgresql-contrib

# Check PostgreSQL status

# After the installation you may double-check that postgresql daemon is active.

service postgresql status

# The output should look like this:

PostgreSQL status


# Start Using PostgreSQL Command Line Tool

# When you install PostgreSQL a default admin user “postgres” is created by the default. You must use it to log-in to your PostgreSQL database for the first time.

# A “psql” command-line client tool is used to interact with the database engine. You should invoke it as a “postgres” user to start an interactive session with your local database.

sudo -u postgres psql


# view connection info 

postgres=#\conninfo


# list databases

postgres=#\l

# view list of users with privilleges

postgres=#\du

# Since the default “postgres” user does not have a password, you should set it yourself.

postgres=#\password postgres

# Create and Populate a New Database

# You are now connected to your database server through psql command line tool with full access rights, so it’s time to create a new database.

CREATE DATABASE test_erp;

# After the new “test_erp” database is created, connect to it.

postgres=#\c test_erp

# Now you are ready to start creating tables where your data will be stored. Let’s create your first table with a primary key, and three client attributes.

postgres=# CREATE TABLE clients (id SERIAL PRIMARY KEY, first_name VARCHAR, last_name VARCHAR, role VARCHAR);


# view created tables

postgres=#\dt


# Let’s now insert the first row into your newly created “clients” table.

INSERT INTO clients (first_name, last_name, role) VALUES ('John', 'Smith', 'CEO');

# And query the table to get all its rows.

SELECT * FROM clients;


# Setup PostgreSQL server


# Let’s now exit the interactive psql session by typing exit, and access postgresql.conf configuration file of PostgreSQL version 14 by using vim text editor.

vim /etc/postgresql/14/main/postgresql.conf

# Uncomment and edit the listen_addresses attribute to start listening to start listening to all available IP addresses.

listen_addresses = '*'

# Now edit the PostgreSQL access policy configuration file.

vim /etc/postgresql/14/main/pg_hba.conf

# Append a new connection policy (a pattern stands for [CONNECTION_TYPE][DATABASE][USER] [ADDRESS][METHOD]) in the bottom of the file.

host all all 0.0.0.0/0 md5

# We are allowing TCP/IP connections (host) to all databases (all) for all users (all) with any IPv4 address (0.0.0.0/0) using an MD5 encrypted password for authentication (md5).

# It is now time to restart your PostgreSQL service to load your configuration changes.

systemctl restart postgresql

# And make sure your system is listening to the 5432 port that is reserved for PostgreSQL.

ss -nlt | grep 5432


# Connect to PostgreSQL database through a remote host

sudo apt install postgresql-client

# Let’s now connect to a remote PostgreSQL database that we have hosted on one of the Cherry Servers machines.

psql -h 5.199.162.56 -p 5432 -d test_erp -U postgres


# postgres user creation

create user saiva with encrypted password 'Saiva@123';

CREATE USER saiva WITH PASSWORD 'Saiva@123';

GRANT readaccess TO saiva;


grant all privileges on database test_erp to saiva;

revoke all privileges on database test_erp from saiva;

# list user in postgres

SELECT usename FROM pg_user;
drop user saiva;


CREATE ROLE sa WITH LOGIN PASSWORD 'some-password.';
CREATE DATABASE master WITH OWNER sa;
\c master;


# create role

CREATE ROLE <role> WITH LOGIN PASSWORD '<password>';

ALTER ROLE <role> WITH LOGIN;
  
ALTER ROLE <role> CREATEDB WITH LOGIN;
  
  
ALTER USER librarian WITH SUPERUSER;
  
ALTER USER librarian WITH NOSUPERUSER;  
  
ALTER ROLE testing CREATEROLE CREATEDB;  
  
  
# How to Create Read Only User
 
#  1. Create Role
# Log into PostgreSQL and run the following command to a create read only role readaccess. Replace role name as per your requirement.

postgres-# CREATE ROLE readaccess;
  
  
# 2. Assign Permission
# Run the following commands to assign access to newly created role, for database mydb. You can change database name as per your requirement.

postgres-# GRANT CONNECT ON DATABASE mydb TO readaccess;
  
# Further we will grant access to all tables in public schema. You can change schema name as per your requirement.

postgres-# GRANT USAGE ON SCHEMA public TO readaccess;
postgres-# GRANT SELECT ON ALL TABLES IN SCHEMA public TO readaccess;
  
# If you want to grant select permission for specific tables (e.g mytable) run the following command

postgres-# GRANT SELECT ON mytable IN SCHEMA public TO readaccess;




# 3. Create User
Finally, we create a PostgreSQL user and assign the newly created role to that user. Update read_user and read_password in commands below with your username and password.

postgres-# CREATE USER read_user WITH PASSWORD 'read_password';
postgres-# GRANT readaccess TO read_user;
  
  
# pg_dump is a nifty utility designed to output a series of SQL statements that describes the schema and data of your database. You can control what goes into your backup by using additional flags.
Backup: pg_dump -h localhost -p 5432 -U postgres -d mydb > backup.sql

Restore: psql -h localhost -p 5432 -U postgres -d mydb < backup.sql

-h is for host.
-p is for port.
-U is for username.
-d is for database.

# Single transaction restore:
# you can use –single-transaction in your restore command. It wraps out entire restore operation in one transaction, if something goes wrong it rollbacks all the changes.
psql –single-transaction -h localhost -p 5432 -U postgres -d mydb < backup.sql

# Compressed Backup:
# If your backup is too big, you can use any compression utility to compress it. I prefer gzip.
Backup: pg_dump -h localhost -p 5432 -U postgres -d mydb | gzip > backup.gz

Restore: gunzip -c backup.gz | psql -h localhost -p 5432 -U postgres -d mydb

# Split Backup file:
# If you are going to email your backup files or transfer them via any medium on internet I will suggest splitting the files into short files. You can # use split utility for splitting the files with a size limit. In the example I am usinf 2mb size limit.
Backup: pg_dump -h localhost -p 5432 -U postgres -d mydb | split -b 2m – backup.sql

Restore: cat backup.sql* | psql -h localhost -p 5432 -U postgres -d mydb

# Split compressed Backup file:
# This is just a combination of point 3 and 4. We first compress the file then split it instead of splitting the plain file.
Backup: pg_dump -h localhost -p 5432 -U postgres -d mydb | gzip | split -b 1m – backup.gz

Restore: cat backup.gz* | gunzip | psql -h localhost -p 5432 -U postgres -d mydb

# Parallel Backup:
You can allow pg_dump to dump the backup data in parallel by including the -j flag. It tells pg_dump the number of tables it can dump in parallel. Parallel backup only works when you use more than one files for writing backup data hence directory. -F d sets the format to directory and -f provides the directory name.
Backup: pg_dump -F d -f backup -j 20 -h localhost -p 5432 -U postgres -d mydb

Restore: pg_restore -F d -j 20 -h localhost -p 5432 -U postgres -d mydb backup

# Backup of a specific table:
You can take backup of a specify table by adding -t flag.
Backup: pg_dump -h localhost -p 5432 -U postgres -d mydb -t my_table > backup.sql

Restore: psql -h localhost -p 5432 -U postgres -d mydb < backup.sql

#Take Backup of all databases:
# pg_dumpall is used to take backup of all of your postgresql database. I think it is just a wrapper around pg_dump. It will ask password for every database.
Backup: pg_dumpall -h localhost -p 5432 -U postgres > backup.sql

Restore: psql -h localhost -p 5432 -U postgres < backup.sql

