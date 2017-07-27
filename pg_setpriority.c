/*
 https://www.bignerdranch.com/blog/lowering-the-priority-of-a-postgresql-query/
*/

#include <sys/time.h>
#include <sys/resource.h>

#include "postgres.h"
#include "fmgr.h"

PG_MODULE_MAGIC;


PG_FUNCTION_INFO_V1(pg_setpriority);

extern Datum pg_setpriority(PG_FUNCTION_ARGS); /* no warn */

Datum pg_setpriority(PG_FUNCTION_ARGS)
{
	int32 priority = PG_GETARG_INT32(0);

	int result = setpriority(PRIO_PROCESS, 0, priority);

	PG_RETURN_INT32(result);
}
