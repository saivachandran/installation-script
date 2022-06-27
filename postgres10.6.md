# install gcc 

apt install gcc zlib1g-dev libreadline6-dev 

# download postgres10.6 package

wget https://ftp.postgresql.org/pub/source/v10.6/postgresql-10.6.tar.bz2   

# extract the package
  
tar -xvf postgresql-10.6.tar.bz2 postgresql-10.6/ 

# change directory

cd postgresql-10.6/

# create directory
  
mkdir /opt/PostgreSQL-10/

# next step

./configure --prefix=/opt/PostgreSQL-10 
  
make
    
make install
   
 
mkdir -p /pgdatabase/data



adduser postgres

  
chown -R postgres. /pgdatabase/data
 
echo 'export PATH=$PATH:/opt/PostgreSQL-10/bin' > /etc/profile.d/postgres.sh

sudo su - postgres

initdb -D /pgdatabase/data/ -U postgres -W


ps -ef |grep -i postgres


ref link:  https://www.tecmint.com/install-postgresql-from-source-code-in-linux/
