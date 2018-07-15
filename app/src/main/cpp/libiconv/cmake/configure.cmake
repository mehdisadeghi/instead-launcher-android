# Simulate autotools detection for config generation
# This insanity is needed for autotools infected packages

# Type checks
include ( CheckTypeSize )
check_type_size ( ptrdiff_t SIZEOF_PTRDIFF_T )
if ( SIZEOF_PTRDIFF_T )
  math ( EXPR BITSIZEOF_PTRDIFF_T "${SIZEOF_PTRDIFF_T} * 8" )
endif ()

set ( CMAKE_EXTRA_INCLUDE_FILES signal.h )
check_type_size ( sig_atomic_t SIZEOF_SIG_ATOMIC_T )
if ( SIZEOF_SIG_ATOMIC_T )
  math ( EXPR BITSIZEOF_SIG_ATOMIC_T "${SIZEOF_SIG_ATOMIC_T} * 8" )
endif ()

check_type_size ( size_t SIZEOF_SIZE_T )
if ( SIZEOF_SIZE_T )
  math ( EXPR BITSIZEOF_SIZE_T "${SIZEOF_SIZE_T} * 8" )
endif ()

set ( CMAKE_EXTRA_INCLUDE_FILES wchar.h )
check_type_size ( wchar_t SIZEOF_WCHAR_T )
if ( SIZEOF_WCHAR_T )
  set ( HAVE_WCHAR_T 1)
  math ( EXPR BITSIZEOF_WCHAR_T "${SIZEOF_WCHAR_T} * 8" )
endif ()

check_type_size ( wint_t SIZEOF_WINT_T )
if ( SIZEOF_WINT_T )
  math ( EXPR BITSIZEOF_WINT_T "${SIZEOF_WINT_T} * 8" )
endif ()

check_type_size ( "long long int" HAVE_LONG_LONG_INT )
check_type_size ( "unsigned long long int" HAVE_UNSIGNED_LONG_LONG_INT )
check_type_size ( _Bool HAVE__BOOL )

# Header checks
include ( CheckIncludeFiles )
check_include_files ( alloca.h HAVE_ALLOCA_H )
check_include_files ( dlfcn.h HAVE_DLFCN_H )
check_include_files ( inttypes.h HAVE_INTTYPES_H )
check_include_files ( mach-o/dyld.h HAVE_MACH_O_DYLD_H )
check_include_files ( memory.h HAVE_MEMORY_H )
check_include_files ( search.h HAVE_SEARCH_H )
check_include_files ( stdint.h HAVE_STDINT_H )
check_include_files ( stdlib.h HAVE_STDLIB_H )
check_include_files ( strings.h HAVE_STRINGS_H )
check_include_files ( string.h HAVE_STRING_H )
check_include_files ( sys/bitypes.h HAVE_SYS_BITYPES_H )
check_include_files ( sys/inttypes.h HAVE_SYS_INTTYPES_H )
check_include_files ( sys/param.h HAVE_SYS_PARAM_H )
check_include_files ( sys/socket.h HAVE_SYS_SOCKET_H )
check_include_files ( sys/stat.h HAVE_SYS_STAT_H )
check_include_files ( sys/time.h HAVE_SYS_TIME_H )
check_include_files ( sys/types.h HAVE_SYS_TYPES_H )
check_include_files ( unistd.h HAVE_UNISTD_H )
check_include_files ( wchar.h HAVE_WCHAR_H )
check_include_files ( winsock2.h HAVE_WINSOCK2_H )

# Function checks
include ( CheckFunctionExists )
check_function_exists ( canonicalize_file_name HAVE_CANONICALIZE_FILE_NAME )
check_function_exists ( dcgettext HAVE_DCGETTEXT )
check_function_exists ( gettext HAVE_GETTEXT )
check_function_exists ( iconv HAVE_ICONV )
check_function_exists ( lstat HAVE_LSTAT )
check_function_exists ( mbrtowc HAVE_MBRTOWC )
check_function_exists ( mbsinit HAVE_MBSINIT )
check_function_exists ( memmove HAVE_MEMMOVE )
check_function_exists ( atoll HAVE_RAW_DECL_ATOLL )
check_function_exists ( chown HAVE_RAW_DECL_CHOWN )
check_function_exists ( dprintf HAVE_RAW_DECL_DPRINTF )
check_function_exists ( dup2 HAVE_RAW_DECL_DUP2 )
check_function_exists ( dup3 HAVE_RAW_DECL_DUP3 )
check_function_exists ( endusershell HAVE_RAW_DECL_ENDUSERSHELL )
check_function_exists ( environ HAVE_RAW_DECL_ENVIRON )
check_function_exists ( euidaccess HAVE_RAW_DECL_EUIDACCESS )
check_function_exists ( faccessat HAVE_RAW_DECL_FACCESSAT )
check_function_exists ( fchdir HAVE_RAW_DECL_FCHDIR )
check_function_exists ( fchmodat HAVE_RAW_DECL_FCHMODAT )
check_function_exists ( fchownat HAVE_RAW_DECL_FCHOWNAT )
check_function_exists ( fcntl HAVE_RAW_DECL_FCNTL )
check_function_exists ( ffsl HAVE_RAW_DECL_FFSL )
check_function_exists ( ffsll HAVE_RAW_DECL_FFSLL )
check_function_exists ( fpurge HAVE_RAW_DECL_FPURGE )
check_function_exists ( fseeko HAVE_RAW_DECL_FSEEKO )
check_function_exists ( fstatat HAVE_RAW_DECL_FSTATAT )
check_function_exists ( fsync HAVE_RAW_DECL_FSYNC )
check_function_exists ( ftello HAVE_RAW_DECL_FTELLO )
check_function_exists ( ftruncate HAVE_RAW_DECL_FTRUNCATE )
check_function_exists ( futimens HAVE_RAW_DECL_FUTIMENS )
check_function_exists ( getcwd HAVE_RAW_DECL_GETCWD )
check_function_exists ( getdelim HAVE_RAW_DECL_GETDELIM )
check_function_exists ( getdomainname HAVE_RAW_DECL_GETDOMAINNAME )
check_function_exists ( canonicalize_file_name HAVE_RAW_DECL_CANONICALIZE_FILE_NAME )
check_function_exists ( getdtablesize HAVE_RAW_DECL_GETDTABLESIZE )
check_function_exists ( getgroups HAVE_RAW_DECL_GETGROUPS )
check_function_exists ( gethostname HAVE_RAW_DECL_GETHOSTNAME )
check_function_exists ( getline HAVE_RAW_DECL_GETLINE )
check_function_exists ( getloadavg HAVE_RAW_DECL_GETLOADAVG )
check_function_exists ( getlogin HAVE_RAW_DECL_GETLOGIN )
check_function_exists ( getlogin_r HAVE_RAW_DECL_GETLOGIN_R )
check_function_exists ( getpagesize HAVE_RAW_DECL_GETPAGESIZE )
check_function_exists ( getsubopt HAVE_RAW_DECL_GETSUBOPT )
check_function_exists ( getusershell HAVE_RAW_DECL_GETUSERSHELL )
check_function_exists ( grantpt HAVE_RAW_DECL_GRANTPT )
check_function_exists ( group_member HAVE_RAW_DECL_GROUP_MEMBER )
check_function_exists ( initstat_r HAVE_RAW_DECL_INITSTAT_R )
check_function_exists ( lchmod HAVE_RAW_DECL_LCHMOD )
check_function_exists ( lchown HAVE_RAW_DECL_LCHOWN )
check_function_exists ( link HAVE_RAW_DECL_LINK )
check_function_exists ( linkat HAVE_RAW_DECL_LINKAT )
check_function_exists ( lseek HAVE_RAW_DECL_LSEEK )
check_function_exists ( lstat HAVE_RAW_DECL_LSTAT )
check_function_exists ( memmem HAVE_RAW_DECL_MEMMEM )
check_function_exists ( mempcpy HAVE_RAW_DECL_MEMPCPY )
check_function_exists ( memrchr HAVE_RAW_DECL_MEMRCHR )
check_function_exists ( mkdirat HAVE_RAW_DECL_MKDIRAT )
check_function_exists ( mkdtemp HAVE_RAW_DECL_MKDTEMP )
check_function_exists ( mkfifo HAVE_RAW_DECL_MKFIFO )
check_function_exists ( mkfifoat HAVE_RAW_DECL_MKFIFOAT )
check_function_exists ( mknod HAVE_RAW_DECL_MKNOD )
check_function_exists ( mknodat HAVE_RAW_DECL_MKNODAT )
check_function_exists ( mkostemp HAVE_RAW_DECL_MKOSTEMP )
check_function_exists ( mkostemps HAVE_RAW_DECL_MKOSTEMPS )
check_function_exists ( openat HAVE_RAW_DECL_OPENAT )
check_function_exists ( pipe HAVE_RAW_DECL_PIPE )
check_function_exists ( pipe2 HAVE_RAW_DECL_PIPE2 )
check_function_exists ( popen HAVE_RAW_DECL_POPEN )
check_function_exists ( pread HAVE_RAW_DECL_PREAD )
check_function_exists ( pthread_sigmask HAVE_RAW_DECL_PTHREAD_SIGMASK )
check_function_exists ( ptsname HAVE_RAW_DECL_PTSNAME )
check_function_exists ( pwrite HAVE_RAW_DECL_PWRITE )
check_function_exists ( random_r HAVE_RAW_DECL_RANDOM_R )
check_function_exists ( rawmemchr HAVE_RAW_DECL_RAWMEMCHR )
check_function_exists ( readlink HAVE_RAW_DECL_READLINK )
check_function_exists ( readlinkat HAVE_RAW_DECL_READLINKAT )
check_function_exists ( realpath HAVE_RAW_DECL_REALPATH )
check_function_exists ( renameat HAVE_RAW_DECL_RENAMEAT )
check_function_exists ( rmdir HAVE_RAW_DECL_RMDIR )
check_function_exists ( rpmatch HAVE_RAW_DECL_RPMATCH )
check_function_exists ( setenv HAVE_RAW_DECL_SETENV )
check_function_exists ( setstate_r HAVE_RAW_DECL_SETSTATE_R )
check_function_exists ( setusershell HAVE_RAW_DECL_SETUSERSHELL )
check_function_exists ( sigaction HAVE_RAW_DECL_SIGACTION )
check_function_exists ( sigaddset HAVE_RAW_DECL_SIGADDSET )
check_function_exists ( sigdelset HAVE_RAW_DECL_SIGDELSET )
check_function_exists ( sigemptyset HAVE_RAW_DECL_SIGEMPTYSET )
check_function_exists ( sigfillset HAVE_RAW_DECL_SIGFILLSET )
check_function_exists ( sigismember HAVE_RAW_DECL_SIGISMEMBER )
check_function_exists ( sigpending HAVE_RAW_DECL_SIGPENDING )
check_function_exists ( sigprocmask HAVE_RAW_DECL_SIGPROCMASK )
check_function_exists ( sleep HAVE_RAW_DECL_SLEEP )
check_function_exists ( snprintf HAVE_RAW_DECL_SNPRINTF )
check_function_exists ( srandom_r HAVE_RAW_DECL_SRANDOM_R )
check_function_exists ( stat HAVE_RAW_DECL_STAT )
check_function_exists ( stpcpy HAVE_RAW_DECL_STPCPY )
check_function_exists ( stpncpy HAVE_RAW_DECL_STPNCPY )
check_function_exists ( strcasestr HAVE_RAW_DECL_STRCASESTR )
check_function_exists ( strchrnul HAVE_RAW_DECL_STRCHRNUL )
check_function_exists ( strdup HAVE_RAW_DECL_STRDUP )
check_function_exists ( strerror_r HAVE_RAW_DECL_STRERROR_R )
check_function_exists ( strncat HAVE_RAW_DECL_STRNCAT )
check_function_exists ( strndup HAVE_RAW_DECL_STRNDUP )
check_function_exists ( strnlen HAVE_RAW_DECL_STRNLEN )
check_function_exists ( strpbrk HAVE_RAW_DECL_STRSEP )
check_function_exists ( strsignal HAVE_RAW_DECL_STRSIGNAL )
check_function_exists ( strtod HAVE_RAW_DECL_STRTOD )
check_function_exists ( strtok_r HAVE_RAW_DECL_STRTOK_R )
check_function_exists ( strtoll HAVE_RAW_DECL_STRTOLL )
check_function_exists ( strtoull HAVE_RAW_DECL_STRTOULL )
check_function_exists ( strverscmp HAVE_RAW_DECL_STRVERSCMP )
check_function_exists ( symlink HAVE_RAW_DECL_SYMLINK )
check_function_exists ( symlinkat HAVE_RAW_DECL_SYMLINKAT )
check_function_exists ( tmpfile HAVE_RAW_DECL_TMPFILE )
check_function_exists ( ttyname_r HAVE_RAW_DECL_TTYNAME_R )
check_function_exists ( unlink HAVE_RAW_DECL_UNLINK )
check_function_exists ( unlinkat HAVE_RAW_DECL_UNLINKAT )
check_function_exists ( unlockpt HAVE_RAW_DECL_UNLOCKPT )
check_function_exists ( unsetenv HAVE_RAW_DECL_UNSETENV )
check_function_exists ( usleep HAVE_RAW_DECL_USLEEP )
check_function_exists ( utimensat HAVE_RAW_DECL_UTIMENSAT )
check_function_exists ( vdprintf HAVE_RAW_DECL_VDPRINTF )
check_function_exists ( vsnprintf HAVE_RAW_DECL_VSNPRINTF )
check_function_exists ( _Exit HAVE_RAW_DECL__EXIT )
check_function_exists ( readlink HAVE_READLINK )
check_function_exists ( readlinkat HAVE_READLINKAT )
check_function_exists ( realpath HAVE_REALPATH )
check_function_exists ( setenv HAVE_SETENV )
check_function_exists ( setlocale HAVE_SETLOCALE )
check_function_exists ( strerror_r HAVE_STRERROR_R )
check_function_exists ( tsearch HAVE_TSEARCH )
check_function_exists ( wcrtomb HAVE_WCRTOMB )
check_function_exists ( _NSGetExecutablePath HAVE__NSGETEXECUTABLEPATH )

# Symbols
include ( CheckSymbolExists )
check_symbol_exists ( alloca "alloca.h" HAVE_ALLOCA )
check_symbol_exists ( clearerr_unlocked "stdio.h" HAVE_DECL_CLEARERR_UNLOCKED )
check_symbol_exists ( feof_unlocked "stdio.h" HAVE_DECL_FEOF_UNLOCKED )
check_symbol_exists ( ferror_unlocked "stdio.h" HAVE_DECL_FERROR_UNLOCKED )
check_symbol_exists ( fflush_unlocked "stdio.h" HAVE_DECL_FFLUSH_UNLOCKED )
check_symbol_exists ( fgets_unlocked "stdio.h" HAVE_DECL_FGETS_UNLOCKED )
check_symbol_exists ( fputc_unlocked "stdio.h" HAVE_DECL_FPUTC_UNLOCKED )
check_symbol_exists ( fputs_unlocked "stdio.h" HAVE_DECL_FPUTS_UNLOCKED )
check_symbol_exists ( fread_unlocked "stdio.h" HAVE_DECL_FREAD_UNLOCKED )
check_symbol_exists ( fwrite_unlocked "stdio.h" HAVE_DECL_FWRITE_UNLOCKED )
check_symbol_exists ( getchar_unlocked "stdio.h" HAVE_DECL_GETCHAR_UNLOCKED )
check_symbol_exists ( getc_unlocked "stdio.h" HAVE_DECL_GETC_UNLOCKED )
check_symbol_exists ( program_invocation_name "stdio.h" HAVE_DECL_PROGRAM_INVOCATION_NAME )
check_symbol_exists ( program_invocation_short_name "stdio.h" HAVE_DECL_PROGRAM_INVOCATION_SHORT_NAME )
check_symbol_exists ( putchar_unlocked "stdio.h" HAVE_DECL_PUTCHAR_UNLOCKED )
check_symbol_exists ( putc_unlocked "stdio.h" HAVE_DECL_PUTC_UNLOCKED )
check_symbol_exists ( setenv "stdlib.h" HAVE_DECL_SETENV )
check_symbol_exists ( strerror_r "string.h" HAVE_DECL_STRERROR_R )
check_symbol_exists ( environ "unistd.h" HAVE_ENVIRON_DECL )
check_symbol_exists ( getcwd "unistd.h" HAVE_GETCWD )
check_symbol_exists ( getc_unlocked "stdio.h" HAVE_GETC_UNLOCKED )
check_symbol_exists ( nl_langinfo "langinfo.h" HAVE_LANGINFO_CODESET )
check_symbol_exists ( mbstate_t "wchar.h" HAVE_MBSTATE_T )

# Other
if ( APPLE )
  set ( HAVE_CFLOCALECOPYCURRENT 1 )
  set ( HAVE_CFPREFERENCESCOPYAPPVALUE 1 )
  set ( HAVE__NSGETEXECUTABLEPATH 1 )
endif ()

# From dist.info
set ( PACKAGE "${DIST_NAME}" )
set ( PACKAGE_BUGREPORT "https://github.com/LuaDist/Repository/issues" )
set ( PACKAGE_NAME "${DIST_NAME}-${DIST_VERSION}" )
set ( PACKAGE_STRING "iconv" )
set ( PACKAGE_TARNAME "${DIST_NAME}-${DIST_VERSION}.dist" )
set ( PACKAGE_URL "${DIST_URL}" )
set ( PACKAGE_VERSION "${DIST_VERSION}" )

set ( INSTALLPREFIX "" )
set ( HAVE_SIGNED_WCHAR_T 1)
set ( HAVE_SIGNED_SIG_ATOMIC_T 1 )
set ( HAVE_SIGNED_WINT_T 1)
set ( HAVE_SIGSET_T )

set ( HAVE_VISIBILITY 1 )
set ( ICONV_CONST "" )
set ( INSTALLPREFIX "" )
set ( MALLOC_0_IS_NONNULL 1 )
set ( HAVE_WORKING_O_NOATIME 0 )
set ( HAVE_WORKING_O_NOFOLLOW 1 )
set ( LSTAT_FOLLOWS_SLASHED_SYMLINK 0 )
set ( PTRDIFF_T_SUFFIX l )
set ( READLINK_TRAILING_SLASH_BUG 1 )
set ( REPLACE_FUNC_STAT_DIR 0 )
set ( REPLACE_FUNC_STAT_FILE 1 )
set ( REPLACE_STRERROR_0 1 )
set ( SIG_ATOMIC_T_SUFFIX 1 )
set ( SIZE_T_SUFFIX ul )
set ( STDC_HEADERS 1 )
set ( STRERROR_R_CHAR_P 0 )
set ( USER_LABEL_PREFIX _ )
set ( USE_UNLOCKED_IO 1 )
set ( VERSION "${DIST_VERSION}" )
set ( WCHAR_T_SUFFIX "" )
set ( WINT_T_SUFFIX "" )
set ( WORDS_LITTLEENDIAN 1 )

# GNULIB settings
set ( GNULIB_CANONICALIZE_LGPL 1 )
set ( GNULIB_SIGPIPE 1 )
set ( GNULIB_STRERROR 1 )
set ( GNULIB_TEST_CANONICALIZE_FILE_NAME 1 )
set ( GNULIB_TEST_ENVIRON 1 )
set ( GNULIB_TEST_LSTAT 1 )
set ( GNULIB_TEST_READ 1 )
set ( GNULIB_TEST_READLINK 1 )
set ( GNULIB_TEST_REALPATH 1 )
set ( GNULIB_TEST_SIGPROCMASK 1 )
set ( GNULIB_TEST_STAT 1 )
set ( GNULIB_TEST_STRERROR 1 )