#!/bin/bash
#if [ $# == "0" ]; then
#echo "please provide file";
#elif [ -f $1 ]; then

        GLIBC=`grep glibc installed-rpms | awk -e '{print $1}'`
        if [ -z "$GLIBC" ]; then
                echo "Can't determine glibc version"
                 exit 0

        fi

        GLUSTER=`grep gluster installed-rpms | egrep -v 'vdsm|libvirt' | awk -e '{print $1}'`
        if [ -z "$GLUSTER" ]; then
                echo "Can't determine gluster version"
                 exit 0

        fi

         yum install -y $GLIBC
        if [ $? != 0 ]; then
                echo "Error installing $GLIBC"
                 exit 0

        fi

        yum install -y $GLUSTER $PACKAGE
        if [ $? != 0 ]; then
                echo "Error installing $GLUSTER"
                 exit 0

        fi

        yum install -y yum-utils gdb file elfutils xz bzip2 wget
        if [ $? != 0 ]; then
                echo "Error installing tools"
                 exit 0

        fi

        debuginfo-install -y $GLIBC $GLUSTER $PACKAGE
        if [ $? != 0 ]; then
                echo "Error installing debug packages"
                 exit 0
        fi

