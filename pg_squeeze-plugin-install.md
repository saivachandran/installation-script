# Install the postgresql-server-dev-10 package, which provides the header files needed to compile Postgres extensions:

```
sudo apt-get install postgresql-server-dev-10
```

# Download the pg_squeeze extension source code from the Github repository:

```
git clone https://github.com/cybertec-postgresql/pg_squeeze.git
```

# Change into the pg_squeeze directory:
```
cd pg_squeeze
```

Compile and install the extension:
```
make
sudo make install
```
