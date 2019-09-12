#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <sys/file.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#define DEBUG_OUTPUT 1

int flock(int fd, int operation)
{
	int nonblock;
	int open_mode;
	struct flock lock;
	int req;
	int err;

	nonblock = operation&LOCK_NB;
	operation &= ~LOCK_NB;

	if(operation==LOCK_SH)
		lock.l_type = F_RDLCK;
	else if(operation==LOCK_EX)
		lock.l_type = F_WRLCK;
	else if(operation==LOCK_UN)
		lock.l_type = F_UNLCK;
	else
	{
		errno = EINVAL;
		return -1;
	}

	lock.l_whence = SEEK_SET;
	lock.l_start = 0;
	lock.l_len = 0;
	lock.l_pid = 0;

	open_mode = fcntl(fd, F_GETFL, NULL)&O_ACCMODE;

	if(lock.l_type==F_RDLCK && open_mode==O_WRONLY)
		lock.l_type = F_WRLCK;
	else if(lock.l_type==F_WRLCK && open_mode==O_RDONLY)
		lock.l_type = F_RDLCK;

	req = (nonblock ? F_OFD_SETLK : F_OFD_SETLKW);

#ifdef DEBUG_OUTPUT
	const char *op_str = NULL;
	if(operation==LOCK_SH)
		op_str = "LOCK_SH";
	else if(operation==LOCK_EX)
		op_str = "LOCK_EX";
	else if(operation==LOCK_UN)
		op_str = "LOCK_UN";

	const char *req_str = NULL;
	if(req==F_OFD_SETLK)
		req_str = "F_OFD_SETLK";
	else if(req==F_OFD_SETLKW)
		req_str = "F_OFD_SETLKW";

	const char *type_str = NULL;
	if(lock.l_type==F_RDLCK)
		type_str = "F_RDLCK";
	else if(lock.l_type==F_WRLCK)
		type_str = "F_WRLCK";
	else if(lock.l_type==F_UNLCK)
		type_str = "F_UNLCK";

	const char *mode_str = NULL;
	if(open_mode==O_RDONLY)
		mode_str = "O_RDONLY";
	else if(open_mode==O_WRONLY)
		mode_str = "O_WRONLY";
	else if(open_mode==O_RDWR)
		mode_str = "O_RDWR";

	printf("Translated flock(%d, %s%s) with open mode %s to fcntl(%d, %s, { .l_type = %s })\n", fd, op_str, (nonblock ? "|LOCK_NB" : ""), mode_str, fd, req_str, type_str);
#endif

	err = fcntl(fd, req, &lock);
	if(err<0)
	{
		err = errno;
#ifdef DEBUG_OUTPUT
		printf("Error %d (%s)\n", err, strerror(errno));
#endif
		if(nonblock && (err==EAGAIN || err==EACCES))
			errno = EWOULDBLOCK;

		return -1;
	}

	return 0;
}