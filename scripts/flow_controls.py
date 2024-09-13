#!/usr/bin/env python3

from kubernetes import client, config
from kubernetes.client.rest import ApiException
from kubernetes.config.config_exception import ConfigException
import time

def main():
    try:
        config.load_kube_config()
    except ConfigException as e:
        print("Exception on loading config: %s\n" % e)
        return

    # Initialize the flow control API client
    # Using deprecated API flowcontrol.apiserver.k8s.io/v1beta2
    flowcontrol_api = client.FlowcontrolApiserverV1beta2Api()

    # Call deprecated API flowcontrol.apiserver.k8s.io/v1beta2
    try:
        flowschemas = flowcontrol_api.list_flow_schema()
        
        # Print the list of FlowSchemas
        print("Current FlowSchemas:")
        for fs in flowschemas.items:
            print(f"- Name: {fs.metadata.name}, PriorityLevel: {fs.spec.priority_level_configuration.name}")

    except ApiException as e:
        print("Exception when calling FlowcontrolApiserverV1beta2Api: %s\n" % e)

    time.sleep(60)

if __name__ == "__main__":
    main()
