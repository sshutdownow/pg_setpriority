#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

#include <sys/time.h>
#include <sys/resource.h>

#include "postgres.h"
#include "fmgr.h"

/* PG_MODULE_MAGIC; */


PG_FUNCTION_INFO_V1(pg_getpriority);

extern Datum pg_getpriority(PG_FUNCTION_ARGS); /* no gcc warn */

Datum pg_getpriority(PG_FUNCTION_ARGS)
{
	int result, lasterr;
	int pid = PG_GETARG_INT32(0);
  
    lasterr = errno;
    /* reset global error variable */
    errno = 0;
    result = getpriority(PRIO_PROCESS, pid);
    if (result == -1 && errno != 0) { /* getpriority() can legitimately return the value -1 */
        ereport(ERROR, (errcode(ERRCODE_SYSTEM_ERROR), (errmsg("getpriority() failed: %m"))));
    }
    errno = lasterr;

	PG_RETURN_INT32(result);
}
