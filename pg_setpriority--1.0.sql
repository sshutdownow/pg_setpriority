-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_setpriority" to load this file. \quit

CREATE FUNCTION setpriority(priority integer) RETURNS integer
    AS '$libdir/pg_setpriority', 'pg_setpriority'
    LANGUAGE C VOLATILE;
    
CREATE FUNCTION getpriority(pid integer default 0) RETURNS integer
    AS '$libdir/pg_setpriority', 'pg_getpriority'
    LANGUAGE C VOLATILE;

ALTER FUNCTION setpriority(integer)
  COMMENT ON FUNCTION setpriority(integer) IS 'set the priority of current PostgreSQL process';

ALTER FUNCTION setpriority(integer)
  COMMENT ON FUNCTION getpriority(integer) IS 'get the priority of PostgreSQL process';

  
