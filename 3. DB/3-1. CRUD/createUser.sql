drop user fresearch CASCADE;
create user fresearch identified by java;
grant CONNECT, RESOURCE to fresearch;
GRANT CREATE VIEW TO fresearch;
conn fresearch/java;
show user;