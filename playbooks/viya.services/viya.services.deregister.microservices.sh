#!/usr/bin/env bash
# Viya 3.3 SAS Configuration server clean up script
###############################################################################
# Script name: viya.services.deregister.microservices.sh                      #
#                                                                             #
# Description: This script streamlines the process of identifying and removing#
#              many orphaned Viya service registrations from the SAS          #
#              Configuration Server (Consul).                                 #
#                                                                             #
# Author: Gilles Chrzaszcz, GEL                                               #
# Date: 2017-05-08                                                            #
# Version: 1.00                                                               #
#                                                                             #
#-----------------------------------------------------------------------------#
# CHANGELOG:                                                                  #
#   2017-05-08: Gilles Chrzaszcz, GEL                                         #
#      init                                                                   #
#                                                                             #
#-----------------------------------------------------------------------------#
# DISCLAIMER:                                                                 #
# This bash script is provided as-is, without warranty of any kind, of any    #
# kind, either express or implied, including, but not limited to, the implied #
# warranties of merchantability, fitness for a particular purpose, or         #
# non-infringement.                                                           #
# SAS Institute shall not be liable whatsoever for any damages arising out of #
# the use of this documentation and code, including any direct, indirect, or  #
# consequential damages. SAS Institute reserves the right to alter or abandon #
# use of this documentation and code at any time.                             #
# In addition, SAS Institute will provide no support for the materials        #
# contained herein.                                                           #
#                                                                             #
###############################################################################
# Parameters:                                                                 #
#    Obtain help                                                              #
#       -h: help                                                              #
#    Mandatory                                                                #
#       -l: To list consul registered services                                #
#    Optional                                                                 #
#       -c: To cleanup consul registered services                             #
#       -d: Debug mode                                                        #
###############################################################################
# Pre-Requisites:                                                             #
#                                                                             #
###############################################################################
# Examples:
#    viya.services.deregister.microservices.sh -h         # Display the script parameters options (help).
#    viya.services.deregister.microservices.sh -l         # List consul registered services.
#    viya.services.deregister.microservices.sh -l -c      # List and cleanup consul registered services.
#    viya.services.deregister.microservices.sh -l -d      # List consul registered services, and print the value of all variables.
#    viya.services.deregister.microservices.sh -l -c -d   # List and cleanup consul registered services, and print the value of all variables.
#                                                                             #
###############################################################################


#Set Script Name variable
SCRIPT=`basename ${BASH_SOURCE[0]}`


#Set fonts for Help.
NORM=`tput sgr0`
BOLD=`tput bold`
REV=`tput smso`


#Help function
function HELP {
   echo -e \\n"Help documentation for ${BOLD}${SCRIPT}.${NORM}"\\n
   echo -e "${REV}Basic usage:${NORM} ${BOLD}$SCRIPT -l${NORM}"\\n
   echo "Command line switches are optional. The following switches are recognized."
   echo "${REV}-l${NORM}  --Sets the value for option ${BOLD}l${NORM}: List consul registered services."
   echo "${REV}-c${NORM}  --Sets the value for option ${BOLD}c${NORM}: Deregister all consul registered services."
   echo "${REV}-d${NORM}  --Sets the value for option ${BOLD}d${NORM}: Debug Mode - Print variables values."
   echo -e "${REV}-h${NORM}  --Displays this help message. No further functions are performed."\\n
   echo -e "Example: ${BOLD}$SCRIPT [-h | [-l {-c} {-d}]"\\n
   exit 1
}


#Check the number of arguments. If none are passed, print help and exit.
NUMARGS=$#
if [ $NUMARGS -eq 0 ]; then
  HELP
fi


#Setup default variables
TRUE="1"                       # Boolean true
FALSE="0"                      # Boolean false
_CURLSILENTMODE="--silent"
_DEBUG=${FALSE}
_LFLAG=${FALSE}
_CFLAG=${FALSE}
SERVER=${HOSTNAME}
SASDELPOYMENTROOT=/opt/sas
SASDELPOYMENTID=viya


#Setup variables using scripts parameters
while getopts "lchd" opt; do
   case $opt in
      l) #Get username
         _LFLAG=${TRUE}
         USERNAME="$OPTARG"
         ;;
      c) #Get password
         _CFLAG=${TRUE}
         PASSWORD="$OPTARG"
         ;;
      h) #Show help
         HELP
         ;;
      d) #Debug - Print variables values
         _DEBUG=${TRUE}
         ;;
      \?) #Unrecognized option - show help
         echo -e \\n"Option -${BOLD}$OPTARG${NORM} not allowed."
         HELP
         exit 2
         ;;
   esac
done

if [ $_DEBUG == $TRUE ];
   then
      {
         echo -e \\n"Number of arguments: $NUMARGS"
         _CFLAG=${FALSE}
      }
fi


#Main program
if [ $_LFLAG == $TRUE ];
   then
      {
         reservedserviceslist=(`${SASDELPOYMENTROOT}/${SASDELPOYMENTID}/home/bin/sas-bootstrap-config agent service list | grep -E '{' | sed -e 's/[\{}": ]/''/g' | sed '/^\s*$/d' | grep -v "[0-9]\{1,3\}-[0-9]\{1,3\}-[0-9]\{1,3\}-[0-9]\{1,3\}"`)
         if [ $_DEBUG == $TRUE ];
            then
               {
#{% raw %}
                  echo -e \\n"Number of reserved consul registered services is ${#reservedserviceslist[@]}"
#{% endraw %}
               }
         fi
         if [ -z "${reservedserviceslist}" ];
            then
               {
                  echo -e \\n"${REV}No reserved consul registered services.${NORM}"
               }
            else
               {
                  echo -e \\n"Reserved consul registered services (DO NOT DEREGISTER THESE CONSUL SERVICES):"
               }
         fi
         for index in ${!reservedserviceslist[@]};
            do
#{% raw %}
               echo "   service $((${index}+1))/${#reservedserviceslist[@]}=\"${reservedserviceslist[${index}]}\""
#{% endraw %}
            done
         serviceslist=(`${SASDELPOYMENTROOT}/${SASDELPOYMENTID}/home/bin/sas-bootstrap-config agent service list | grep -E '{' | sed -e 's/[\{}": ]/''/g' | sed '/^\s*$/d' | grep "[0-9]\{1,3\}-[0-9]\{1,3\}-[0-9]\{1,3\}-[0-9]\{1,3\}"`)
         if [ $_DEBUG == $TRUE ];
            then
               {
#{% raw %}
                  echo -e \\n"Number of consul registered services is ${#serviceslist[@]}"
#{% endraw %}
               }
         fi
         if [ -z "${serviceslist}" ];
            then
               {
                  echo -e \\n"${REV}No consul registered services.${NORM}"
               }
            else
               {
                  echo -e \\n"Consul registered services:"
               }
         fi
         for index in ${!serviceslist[@]};
            do
#{% raw %}
               echo "   service $((${index}+1))/${#serviceslist[@]}=\"${serviceslist[${index}]}\""
#{% endraw %}
               if [ $_CFLAG == $TRUE ];
                  then
                     {
                        ${SASDELPOYMENTROOT}/${SASDELPOYMENTID}/home/bin/sas-bootstrap-config agent service deregister ${serviceslist[${index}]}
                        echo "      Sevice deregistered"
                     }
               fi
               if [ $_DEBUG == $TRUE ];
                  then
                     {
                        echo "      Deregister service command: ${SASDELPOYMENTROOT}/${SASDELPOYMENTID}/home/bin/sas-bootstrap-config agent service deregister ${serviceslist[${index}]}"
                     }
               fi
            done
         echo " "
      }
   else
      {
         echo "One argument is missing!"
         HELP
      }
fi


exit 0
