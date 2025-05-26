#!/bin/bash


function do_pndrs_version() {
  PNDRSVERSION=$1
  SVNREV=$2
  export INTROOT=/pionier/pndrs_v$PNDRSVERSION
  export PATH=$INTROOT/bin:$INTROOT/yorick/bin:$PATH
  svn co --trust-server-cert -r $SVNREV https://forge.osug.fr/svn//ipag-sw/YOCO/trunk/yoco
  svn co --trust-server-cert -r $SVNREV https://forge.osug.fr/svn/ipag-sw/PIONIER/trunk/pndrs
  #  
  cp -ar yoco/distrib yoco/distrib.$SVNREV
  cp -ar pndrs/distrib pndrs/distrib.$SVNREV 
  cd yoco/distrib.$SVNREV; ./install.sh -y
  cd -
  cd pndrs/distrib.$SVNREV; ./install.sh -y
  cd -
# Do not remve to save svn exchanges building multiples versions
#  rm -rf yoco pndrs
}

# todo : check params
do_pndrs_version $1 $2

