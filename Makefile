# the extensions name
EXTENSION = pg_setpriority

# script files to install
DATA = pg_setpriority--1.0.sql

# our test script file (without extension)
REGRESS = pg_setpriority_test

MODULE_big = pg_setpriority
OBJS = pg_setpriority.o

# postgres build stuff
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
