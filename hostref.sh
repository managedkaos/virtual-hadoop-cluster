#!/usr/bin/env bash

 curl -i -s -X POST -u "admin:admin" http://vm-cluster-node1:7180/api/v13/hosts/460b1cde-3ac0-44fc-bc98-c68f9fc76cec/commands/enterMaintenanceMode
ROLE_HOST_ID=$(curl -su admin:admin -X GET http://vm-cluster-node1:7180/api/v13/clusters/Cluster_001/services/__SERVICE-NAME__/roles/__SERVICE__ROLE-NAME__UUID__ | python -c 'import json, sys; obj=json.load(sys.stdin);print obj["hostRef"]["hostId"]')
curl -su admin:admin -X GET http://cm.cloudera.com:7180/api/v6/hosts/$ROLE_HOST_ID | python -c 'import json, sys; obj=json.load(sys.stdin);print obj["hostname"]'
