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





