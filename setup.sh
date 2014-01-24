#!/bin/bash
service mysql start

EXPECTED_ARGS=2
E_BADARGS=65
MYSQL=`which mysql`
 
 
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbuser dbpass"
  exit $E_BADARGS
fi

RESULT=`mysqlshow -u $1 -p$2 ctf | grep -v Wildcard | grep -o ctf`
if [ "$RESULT" == "ctf" ]; then
	echo "Database Exists"
else
	echo "Creating Database 'CTF'"
	
	Q1="CREATE DATABASE IF NOT EXISTS ctf;"
	Q2="GRANT ALL ON *.* TO '$1'@'localhost' IDENTIFIED BY '$2';"
	Q3="FLUSH PRIVILEGES;"
	SQL="${Q1}${Q2}${Q3}"
	$MYSQL -u$1 -p$2 -e "$SQL"
	mysql -u$1 -p$2 ctf < sql/ctf.sql
fi
