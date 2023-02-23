 Install the postgresql-server-dev-10 package, which provides the header files needed to compile Postgres extensions:

```
sudo apt-get install postgresql-server-dev-10
```

 Download the pg_squeeze extension source code from the Github repository:

```
git clone https://github.com/cybertec-postgresql/pg_squeeze.git
```

 Change into the pg_squeeze directory:
```
cd pg_squeeze
```

Compile and install the extension:
```
make
sudo make install
```

Apply the following settings to postgresql.conf:

```
wal_level = logical

max_replication_slots = 1 # ... or add 1 to the current value.

shared_preload_libraries = 'pg_squeeze' # ... or add the library to the existing ones.
```

Restart postgres service to reflect
```
systemctl restart postgresql.service
```
 
Create the extension by running the following command:
```
CREATE EXTENSION pg_squeeze; 
```
Verify that the pg_squeeze extension is installed and enabled in your database. You can check this by running the following SQL query:
```
SELECT * FROM pg_extension WHERE extname = 'pg_squeeze';
```
[Referl_link](https://github.com/cybertec-postgresql/pg_squeeze)

```
[Referl_link]([https://github.com/cybertec-postgresql/pg_squeeze](https://www.cybertec-postgresql.com/en/pg_squeeze-optimizing-postgresql-storage/))


