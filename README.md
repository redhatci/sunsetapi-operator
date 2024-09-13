# SunsetAPI-Operator

This operator is created to use the `FlowcontrolApiserverV1beta2Api`, which works in OCP 4.15 (Kubernetes 1.28) and is deprecated in OCP 4.16 (Kubernetes 1.29). It is for use in the [certsuite-qe repository](https://github.com/redhat-best-practices-for-k8s/certsuite-qe) for testing purposes.

## How to deploy

```
$ make show
kubectl get crds | grep sunsetapi
sunsetapis.sunsetapi.com                                          2024-09-13T20:13:28Z
kubectl get sunsetapis -n default
NAME           AGE
my-sunsetapi   50s
kubectl get pods
NAME                                 READY   STATUS    RESTARTS   AGE
sunsetapi-operator-757f8bb59-dbqlv   1/1     Running   0          50s

$ make logs
----- Ansible Debug Result (sunsetapi.com/v1, Kind=SunsetApi, my-sunsetapi/default) -----
PLAYBOOK: cdd1a8865a7447309be34c55d5132f02 *************************************
1 plays in /tmp/ansible-operator/runner/sunsetapi.com/v1/SunsetApi/default/my-sunsetapi/project/cdd1a8865a7447309be34c55d5132f02

PLAY [localhost] ***************************************************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]

TASK [sunsetapi : Trigger flow_controls.py] ************************************
task path: /opt/ansible/roles/sunsetapi/tasks/main.yml:2
changed: [localhost] => {"changed": true, "cmd": "/opt/ansible/scripts/flow_controls.py", "delta": "0:01:00.697878", "end": "2024-09-13 20:39:39.680229", "msg": "", "rc": 0, "start": "2024-09-13 20:38:38.982351", "stderr": "", "stderr_lines": [], "stdout": "Current FlowSchemas:\n- Name: workload-leader-election, PriorityLevel: leader-election\n- Name: kube-controller-manager, PriorityLevel: workload-high\n- Name: openshift-apiserver-sar, PriorityLevel: exempt\n- Name: openshift-etcd-operator, PriorityLevel: openshift-control-plane-operators\n- Name: openshift-kube-apiserver-operator, PriorityLevel: openshift-control-plane-operators\n- Name: openshift-oauth-server, PriorityLevel: workload-high\n- Name: endpoint-controller, PriorityLevel: workload-high\n- Name: kube-scheduler, PriorityLevel: workload-high\n- Name: kube-system-service-accounts, PriorityLevel: workload-high\n- Name: openshift-monitoring-metrics, PriorityLevel: exempt\n- Name: openshift-oauth-apiserver, PriorityLevel: workload-high\n- Name: openshift-controller-manager, PriorityLevel: workload-high\n- Name: openshift-oauth-apiserver-sar, PriorityLevel: exempt\n- Name: openshift-ovn-kubernetes, PriorityLevel: system\n- Name: catch-all, PriorityLevel: catch-all\n- Name: exempt, PriorityLevel: exempt\n- Name: global-default, PriorityLevel: global-default\n- Name: openshift-apiserver-operator, PriorityLevel: openshift-control-plane-operators\n- Name: openshift-authentication-operator, PriorityLevel: openshift-control-plane-operators\n- Name: probes, PriorityLevel: exempt\n- Name: system-leader-election, PriorityLevel: leader-election\n- Name: system-node-high, PriorityLevel: node-high\n- Name: system-nodes, PriorityLevel: system\n- Name: openshift-apiserver, PriorityLevel: workload-high\n- Name: service-accounts, PriorityLevel: workload-low", "stdout_lines": ["Current FlowSchemas:", "- Name: workload-leader-election, PriorityLevel: leader-election", "- Name: kube-controller-manager, PriorityLevel: workload-high", "- Name: openshift-apiserver-sar, PriorityLevel: exempt", "- Name: openshift-etcd-operator, PriorityLevel: openshift-control-plane-operators", "- Name: openshift-kube-apiserver-operator, PriorityLevel: openshift-control-plane-operators", "- Name: openshift-oauth-server, PriorityLevel: workload-high", "- Name: endpoint-controller, PriorityLevel: workload-high", "- Name: kube-scheduler, PriorityLevel: workload-high", "- Name: kube-system-service-accounts, PriorityLevel: workload-high", "- Name: openshift-monitoring-metrics, PriorityLevel: exempt", "- Name: openshift-oauth-apiserver, PriorityLevel: workload-high", "- Name: openshift-controller-manager, PriorityLevel: workload-high", "- Name: openshift-oauth-apiserver-sar, PriorityLevel: exempt", "- Name: openshift-ovn-kubernetes, PriorityLevel: system", "- Name: catch-all, PriorityLevel: catch-all", "- Name: exempt, PriorityLevel: exempt", "- Name: global-default, PriorityLevel: global-default", "- Name: openshift-apiserver-operator, PriorityLevel: openshift-control-plane-operators", "- Name: openshift-authentication-operator, PriorityLevel: openshift-control-plane-operators", "- Name: probes, PriorityLevel: exempt", "- Name: system-leader-election, PriorityLevel: leader-election", "- Name: system-node-high, PriorityLevel: node-high", "- Name: system-nodes, PriorityLevel: system", "- Name: openshift-apiserver, PriorityLevel: workload-high", "- Name: service-accounts, PriorityLevel: workload-low"]}

TASK [sunsetapi : Get SunsetApi information] ***********************************
ok: [localhost] => {"api_found": true, "changed": false, "resources": [{"apiVersion": "sunsetapi.com/v1", "kind": "SunsetApi", "metadata": {"annotations": {"kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"sunsetapi.com/v1\",\"kind\":\"SunsetApi\",\"metadata\":{\"annotations\":{},\"name\":\"my-sunsetapi\",\"namespace\":\"default\"},\"spec\":{\"sunsetAPICount\":\"0\"}}\n"}, "creationTimestamp": "2024-09-13T20:38:32Z", "generation": 1, "managedFields": [{"apiVersion": "sunsetapi.com/v1", "fieldsType": "FieldsV1", "fieldsV1": {"f:metadata": {"f:annotations": {".": {}, "f:kubectl.kubernetes.io/last-applied-configuration": {}}}, "f:spec": {".": {}, "f:sunsetAPICount": {}}}, "manager": "kubectl-client-side-apply", "operation": "Update", "time": "2024-09-13T20:38:32Z"}], "name": "my-sunsetapi", "namespace": "default", "resourceVersion": "43642", "uid": "e12c9c43-d6e8-4c48-b8a0-5d9cd4a36d03"}, "spec": {"sunsetAPICount": "0"}}]}
redirecting (type: action) community.kubernetes.k8s to kubernetes.core.k8s_info

TASK [sunsetapi : Increase sunsetAPICount] *************************************
task path: /opt/ansible/roles/sunsetapi/tasks/main.yml:12
changed: [localhost] => {"changed": true, "method": "update", "result": {"apiVersion": "sunsetapi.com/v1", "kind": "SunsetApi", "metadata": {"annotations": {"kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"sunsetapi.com/v1\",\"kind\":\"SunsetApi\",\"metadata\":{\"annotations\":{},\"name\":\"my-sunsetapi\",\"namespace\":\"default\"},\"spec\":{\"sunsetAPICount\":\"0\"}}\n"}, "creationTimestamp": "2024-09-13T20:38:32Z", "generation": 2, "managedFields": [{"apiVersion": "sunsetapi.com/v1", "fieldsType": "FieldsV1", "fieldsV1": {"f:metadata": {"f:annotations": {".": {}, "f:kubectl.kubernetes.io/last-applied-configuration": {}}}, "f:spec": {}}, "manager": "kubectl-client-side-apply", "operation": "Update", "time": "2024-09-13T20:38:32Z"}, {"apiVersion": "sunsetapi.com/v1", "fieldsType": "FieldsV1", "fieldsV1": {"f:spec": {"f:sunsetAPICount": {}}}, "manager": "OpenAPI-Generator", "operation": "Update", "time": "2024-09-13T20:39:41Z"}], "name": "my-sunsetapi", "namespace": "default", "resourceVersion": "43782", "uid": "e12c9c43-d6e8-4c48-b8a0-5d9cd4a36d03"}, "spec": {"sunsetAPICount": "1"}}}

PLAY RECAP *********************************************************************
localhost                  : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

## How to ensure API validity before the OCP upgrade

Let's use [Red Hat Best Practices Certification for k8s](https://github.com/redhat-best-practices-for-k8s/certsuite/releases/tag/v5.3.3) release v5.3.3+.

```
$ wget https://github.com/redhat-best-practices-for-k8s/certsuite/releases/download/v5.3.3/certsuite-v5.3.3-x86_64.tar.gz

$ certsuite-v5.3.3 run --label-filter 'observability' --config-file best_practices_for_k8s/config/tnf_config.yml --kubeconfig= ~/.kube/config --output-dir best_practices_for_k8s/results

-- snip --

-----------------------------------------------------------
| LOG (observability-compatibility-with-next-ocp-release) |
-----------------------------------------------------------
[INFO] [Sep 13 23:28:47.043] [check.go: 270] [observability-compatibility-with-next-ocp-release] Running check (labels: [common observability-compatibility-with-next-ocp-release observability])
[INFO] [Sep 13 23:28:47.043] [suite.go: 398] [observability-compatibility-with-next-ocp-release] Is OCP: true
[INFO] [Sep 13 23:28:47.454] [suite.go: 415] [observability-compatibility-with-next-ocp-release] Detected 4 unique service account names for the workload: map[builder:{} default:{} deployer:{} sunsetapi-operator-service-account:{}]
[INFO] [Sep 13 23:28:47.454] [checksdb.go: 115] [observability-compatibility-with-next-ocp-release] Recording result "FAILED", claimID: {Id:observability-compatibility-with-next-ocp-release Suite:observability Tags:common}

$ cat best_practices_for_k8s/results/claim.json
-- snip --
[observability-compatibility-with-next-ocp-release] Recording result \"FAILED\"
-- snip --
"checkDetails": "{\"CompliantObjectsOut\":null,\"NonCompliantObjectsOut\":[{\"ObjectType\":\"API\",\"ObjectFieldsKeys\":[\"Reason For Non Compliance\",\"RemovedInRelease\",\"APIName\",\"ServiceAccount\"],\"ObjectFieldsValues\":[\"API flowschemas.v1beta2.flowcontrol.apiserver.k8s.io used by service account sunsetapi-operator-service-account is NOT compliant with Kubernetes version 1.29.0, it will be removed in release 1.29\",\"1.29\",\"flowschemas.v1beta2.flowcontrol.apiserver.k8s.io\",\"sunsetapi-operator-service-account\"]}]}",
-- snip --
```
