#!/bin/bash

# ======================================================================
#  FILE:  $URL$
# ======================================================================
#  PROJECT:             :  SARGON
#  VERSION              :  $Revision$
#  LANGUAGE             :  Shell script
#  AUTHOR               :  $LastChangedBy$ 
#  COPYRIGHT            :  AVOS - GMV,S.A.
#  COMPILER             :  -
#  CREATED              :  $CreationDate$
#  CLASS                :  -
#  LAST MODIFIED        :  $LastChangedDate$
#  GENERATED FROM MODEL :  -
#  ORIGINAL MODEL AUTHOR:  -
# ----------------------------------------------------------------------
#  Generates C code for a set of ASN.1 types
# ----------------------------------------------------------------------
#  HISTORY
#  $History$
# ======================================================================

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <OUTPUT_DIR> <1st_DIR_WITH_ASNs> <2nd_DIR_WITH_ASNs> ..."
    exit
fi

mkdir -p $2
echo "-- ASN1 directories: ${@:2}"
mono ${ASN1SCC} -c -typePrefix asn1Scc -o $1 `find "${@:2}" -name "*.asn"`
