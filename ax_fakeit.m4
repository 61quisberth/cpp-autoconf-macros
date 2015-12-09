# Fakeit autoconf macro (standlone)
# SYNOPSIS
#
#   AX_FAKEIT
#
# DESCRIPTION
#
#   For inclusion of header-only c++ mocking lib
#   Standalone single-header version
#
# LICENSE
#
#   Copyright (c) 2015 Jason Quisberth <61quisberth@cardinalmail.cua.edu>
#
#   Copying and distribution of this file, with or without modification,
#   are permitted in any medium without royalty provided the copyright
#   notice and this notice are preserved.  This file is offered as-is,
#   without any warranty.
AC_DEFUN([AX_FAKEIT],
[
  AC_ARG_WITH([fakeit],
    [AS_HELP_STRING([--with-fakeit@<:@=<dir>@:>@], [Location of Fakeit header])],
    [
      case $withval in
      yes)
        acx_with_fakeit=yes
      ;;
      no)
        acx_with_fakeit=no
      ;;
      *)
        acx_with_fakeit=yes
        FAKEIT_CPPFLAGS="-std=c++11 -I$withval"
      ;;
      esac
    ]
    [acx_with_fakeit=yes]
  )
  
  with_fakeit=no
  if test "$acx_with_fakeit" != no; then
    # Check for the presence of Fakeit header files.
    ac_save_CPPFLAGS="$CPPFLAGS"
    CPPFLAGS="$FAKEIT_CPPFLAGS $CPPFLAGS"
    AC_LANG_PUSH([C++])
    dnl AC_CHECK_HEADER([single_header/standalone/fakeit.hpp], [with_fakeit=yes],
    AC_CHECK_HEADER([fakeit.hpp], [with_fakeit=yes],
      [AC_MSG_ERROR([Unable to find the fakeit.hpp header file.])])
    # determine library version
    dnl AC_MSG_CHECKING([Fakeit header library version])
    dnl EIGEN_MACRO_HEADER=$withval/Eigen/src/Core/util/Macros.h
    dnl EIGEN_WORLD=`$AWK '/define[[ \t]]+EIGEN_WORLD_VERSION/{print $ 3}' $EIGEN_MACRO_HEADER`
    dnl EIGEN_MAJOR=`$AWK '/define[[ \t]]+EIGEN_MAJOR_VERSION/{print $ 3}' $EIGEN_MACRO_HEADER`
    dnl EIGEN_MINOR=`$AWK '/define[[ \t]]+EIGEN_MINOR_VERSION/{print $ 3}' $EIGEN_MACRO_HEADER`
    dnl EIGEN_VERSION=$EIGEN_WORLD.$EIGEN_MAJOR.$EIGEN_MINOR
    dnl AC_MSG_RESULT($EIGEN_VERSION)
    dnl AC_SUBST(EIGEN_VERSION)
    AC_LANG_POP([C++])
    CPPFLAGS="$ac_save_CPPFLAGS"
    AC_DEFINE([HAVE_FAKEIT], [1], [Define if you have the Fakeit header files])
    AC_SUBST([FAKEIT_CPPFLAGS])
  fi
])
