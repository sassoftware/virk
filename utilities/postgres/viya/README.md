# SAS Viya Infrastructure Resource Kit (VIRK) - sds_micro_service_pg_connection_test.sh

## Introduction
* SAS DataServer (Postgres) utility script i.e. **sds_micro_service_pg_connection_test.sh** to get connection/session count per micro service for a given cluster and it also tests connectivity for Postgres and pgpool nodes.
* It can be run with interval option to capture the snapshot of no of connections.
* It helps in identifying which micro services is taking up min. and max. connections.

## Pre-requisites for running the script
- SAS Viya 3.4 all services must be up & running

## Install the script

* Logon to pgpool host as root/sudoer and switch to sas user:
    
    ```$ sudo su - sas```
 
* Download the script:

    ```$ curl -o sds_micro_service_pg_connection_test.sh https://gitlab.sas.com/SDE-BareOS/PostgresUtl/raw/master/viya/sds_micro_service_pg_connection_test.sh```
   
* Change file permission to 755

    ```$ chmod 755 sds_micro_service_pg_connection_test.sh```
   
* To get help

    ```$ ./sds_micro_service_pg_connection_test.sh -h```

## Running the script

* Logon to pgpool host as root/sudoer and switch to sas user:

    ````sudo su - sas```
 
 To run/executing the script, refer to examples section below.

**Usage:**
<pre>
./sds_micro_service_pg_connection_test.sh -s [ServiceName|ClusterName] -i [No of iterations] -w [Wait time]
</pre>

**Options:** 
<pre>
s - ServiceName or ClusterName, for example, 'sds-ci' or 'postgres' - Optional parameter
i - No of iterations,           for example, '10' or '25'           - Optional parameter
w - Wait time in seconds,       for example, '5' or '15'            - Optional parameter
</pre>

 **Defaults**:
<pre>
 ClusterName is set to       : All Clusters define in the Consul
 No of iterations are set to : 1
 Wait time is set to         : 5 seconds
</pre>

 **Examples:** 
<pre>
./sds_micro_service_pg_connection_test.sh -s postgres -i 25 -w 10   :-> One cluster  and 25 iterations, wait 10 seconds
./sds_micro_service_pg_connection_test.sh -s postgres               :-> One cluster  and  1 iteration , wait  5 seconds

./sds_micro_service_pg_connection_test.sh                           :-> All clusters and  1 iteration , wait  5 seconds
./sds_micro_service_pg_connection_test.sh -i 5 -w 15                :-> All clusters and  5 iterations, wait 15 seconds
</pre>
