# ======================================================================
#  FILE:  $URL$
# ======================================================================
#  PROJECT:             :  SARGON
#  VERSION              :  $Revision$
#  LANGUAGE             :  CMake script
#  AUTHOR               :  $LastChangedBy$ 
#  COPYRIGHT            :  AVOS - GMV,S.A.
#  COMPILER             :  cmake version 3.0.2
#  CREATED              :  $CreationDate$
#  CLASS                :  -
#  LAST MODIFIED        :  $LastChangedDate$
#  GENERATED FROM MODEL :  -
#  ORIGINAL MODEL AUTHOR:  -
# ----------------------------------------------------------------------
#  Toplevel CMake build script for the asn1_types library
# ----------------------------------------------------------------------
#  HISTORY
#  $History$
# ======================================================================

# CMakeLists.txt has to be located in the project folder and cmake has to be
# executed from 'project/build' with 'cmake ../'.
cmake_minimum_required(VERSION 2.6)

# Check SARGON environment
if (NOT DEFINED ENV{AUTOPROJ_CURRENT_ROOT})
    message(FATAL_ERROR "Environment variable AUTOPROJ_CURRENT_ROOT not set. Run env.sh.")
endif()

find_package(Sargon)

message(STATUS "Running asn-generate-c.sh script")
execute_process(COMMAND ${CMAKE_SOURCE_DIR}/scripts/asn-generate-c.sh ${CMAKE_SOURCE_DIR}/src ${CMAKE_SOURCE_DIR}/asn RESULT_VARIABLE CMD_RESULT)
if (NOT ${CMD_RESULT} EQUAL 0)
    message(FATAL_ERROR "Error compiling ASN.1 files")
endif()

set(SARGON_USE_CXX11 TRUE)
set(CMAKE_BUILD_TYPE $ENV{CMAKE_BUILD_TYPE})
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
sargon_init(asn1_types 1.0)
sargon_standard_layout()

install(DIRECTORY ${CMAKE_SOURCE_DIR}/asn/base DESTINATION share/taste/asn1_types)
install(DIRECTORY ${CMAKE_SOURCE_DIR}/asn/drivers DESTINATION share/taste/asn1_types)
install(DIRECTORY ${CMAKE_SOURCE_DIR}/asn/sargon DESTINATION share/taste/asn1_types)
