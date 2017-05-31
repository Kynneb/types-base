#! /bin/sh

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <PATH_TO_ASN_ACN_FILES> <OUTPUT_PATH> <OUTPUT_FILE_NAME>"
    exit
fi

dataViewAADL=${3}".aadl"
dataViewAADL="${2}/${dataViewAADL}"

echo "name: $0"
echo "asn : $1"
echo "out : $2"
echo "onam: $3"
echo $dataViewAADL

asn2aadlPlus \
`find "$1" -maxdepth 1 -name "*.asn" -printf '%p '`\
`find "$1" -maxdepth 1 -name "*.acn" -printf '%p '`\
$dataViewAADL
