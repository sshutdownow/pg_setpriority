# pg_setpriority

Code with minor changes taken from [Chris Kelly blog](https://www.bignerdranch.com/blog/lowering-the-priority-of-a-postgresql-query/). I just have added Makefile and sql script to register extesion.

Download and unpack.
-----------------------

Compilation.
------------
To compile the source code postgresql-devel package is required, to fullfill requirement for RedHat/CentOS do `yum install postgresql-devel`, for Debian/Ubuntu you should install postgresql-server-dev package (`sudo apt-get install postgresql-server-dev`):


Install:
--------
```
make install
```

Register extension:
-------------------
CREATE EXTENSION pg_setpriority;

USAGE:
------
```
SELECT setpriority(10 /* priority integer */);
SELECT getpriority(/* pid integer default 0 */);
```
