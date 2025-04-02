#!/usr/bin/env sh

# apply the Cassandra StorageClass
kubectl apply -f cassandra-storage.yaml -n default
# apply the Cassandra ConfigMap
kubectl apply -f cassandra-configmap.yaml -n default
# apply the Cassandra StatefulSet
kubectl apply -f cassandra-statefulset.yaml -n default
# apply the Cassandra Service
kubectl apply -f cassandra-service.yaml -n default
# Verify that the StatefulSet is running
kubectl get statefulset cassandra -n default
# Verify that the pods are running
kubectl get pods -n default
# Verify that the service is running
kubectl get service cassandra -n default
# Verify that the persistent volume claim is bound
kubectl get pvc cassandra-pvc -n default
# Verify that the persistent volume is bound
kubectl get pv cassandra-pv
# Verify that the Cassandra cluster is running
kubectl exec -it cassandra-0 -n default -- nodetool status
# Verify that the Cassandra cluster is healthy
kubectl exec -it cassandra-0 -n default -- nodetool info
# Verify that the Cassandra cluster is up and running
kubectl exec -it cassandra-0 -n default -- nodetool ring
# Verify that the Cassandra cluster is accepting connections
kubectl exec -it cassandra-0 -n default -- cqlsh
# Verify that the Cassandra cluster is accepting connections
kubectl exec -it cassandra-0 -n default -- cqlsh -e "SELECT now() FROM system.local;"
# Verify that the Cassandra cluster is accepting connections
kubectl exec -it cassandra-0 -n default -- cqlsh -e "SELECT * FROM system_schema.keyspaces;"
# Verify that the Cassandra cluster is accepting connections
kubectl exec -it cassandra-0 -n default -- cqlsh -e "SELECT * FROM system_schema.tables;"
# Verify that the Cassandra cluster is accepting connections
sleep 300
# delete the Cassandra StatefulSet
kubectl delete statefulset cassandra -n default
# delete the Cassandra Service
kubectl delete service cassandra -n default
# delete the Cassandra ConfigMap
kubectl delete configmap cassandra-config -n default
# delete the Cassandra StorageClass
kubectl delete storageclass cassandra-sc -n default

