# Process this file with autoconf to produce a configure script.
# author: Mike Smith (mike.smith@embl.de)

AC_INIT([rhdf5], [2.25.4-1], [mike.smith@embl.de])
AC_CONFIG_SRCDIR([src])

if test [ -n "${PKG_LIBS}" ] ; then
     LIBS="${PKG_LIBS} ${LIBS}"
fi

echo $LIBS

AC_SUBST(LIBS)
AC_CONFIG_FILES([src/Makevars])
AC_OUTPUT
