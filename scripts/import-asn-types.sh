#! /bin/sh

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <PATH_TO_TASTE_ROOT_DIR> <PATH_TO_ASN_ACN_FILES>"
    exit
fi

dataViewAADL="DataView.aadl"
dataViewAADL=${1}${dataViewAADL} 

asn2aadlPlus \
`find "$1" -maxdepth 1 -name "*.asn" -printf '%p '`\
`find "$1" -maxdepth 1 -name "*.acn" -printf '%p '`\
`find "$2" -name "*.asn" -printf '%p '`\
`find "$2" -name "*.acn" -printf '%p '`$dataViewAADL
