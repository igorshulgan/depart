# Depart
This is an web application to satisfy needs of a company which need to re-educate it's stuff.

# DB dump
To work successfully you need to install a local Database. To do so please install latest version of PostgreSQL. The link: 
http://www.postgresql.org/download/. After that you should create a database called depart and restore information from dump.sql:

    psql depart < dump.sql -U postgres
  
You can find more information about this here: http://www.postgresql.org/docs/9.1/static/backup-dump.html.
This app assumes that your user login is 'postgres' and password is the same.

# TomCat v8.0
You will need a tomcat server to run this application
