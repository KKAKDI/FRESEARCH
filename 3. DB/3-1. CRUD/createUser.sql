drop user FRESEARCH CASCADE;
create user FRESEARCH identified by JAVA;
grant CONNECT, RESOURCE to FRESEARCH;
conn FRESEARCH/JAVA;
show user;