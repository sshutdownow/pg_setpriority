# pg_setpriority

Code with minor changes taken from [Chris Kelly blog](https://www.bignerdranch.com/blog/lowering-the-priority-of-a-postgresql-query/). I just have added Makefile and sql script to register extesion.

To compile and install:
-----------------------
make install

Register extension:
-------------------
CREATE EXTENSION pg_setpriority;
