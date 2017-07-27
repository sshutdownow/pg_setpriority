-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_setpriority" to load this file. \quit

CREATE FUNCTION setpriority(integer) RETURNS integer
    AS '$libdir/pg_setpriority', 'pg_setpriority'
    LANGUAGE C VOLATILE;

ALTER FUNCTION setpriority(integer)
  OWNER TO postgres;
  COMMENT ON FUNCTION setpriority(integer) IS 'set the priority of PostgreSQL process';
  