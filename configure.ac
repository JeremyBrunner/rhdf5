# Process this file with autoconf to produce a configure script.
# author: Mike Smith (mike.smith@embl.de)

AC_INIT([rhdf5], [2.25.5-1], [mike.smith@embl.de])
AC_CONFIG_SRCDIR([src])

if test [ -n "${PKG_LIBS}" ] ; then
     LIBS="${PKG_LIBS} ${LIBS}"
fi

echo $LIBS

if test [ -n "${PKG_CFLAGS}" ] ; then
     CFLAGS="${PKG_CFLAGS} ${CFLAGS}"
fi

if test [ -n "${PKG_CXXFLAGS}" ] ; then
     CXXFLAGS="${PKG_CXXFLAGS} ${CXXFLAGS}"
fi

AC_SUBST(LIBS)
AC_SUBST(CFLAGS)
AC_SUBST(CXXFLAGS)
AC_CONFIG_FILES([src/Makevars])
AC_OUTPUT
