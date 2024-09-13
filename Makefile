BASE_NAME := sunsetapi
IMAGE_NAME := quay.io/tkrishtop/$(BASE_NAME)-operator:latest
NAMESPACE := default

build:
	podman build -t $(IMAGE_NAME) .

push: build
	podman push $(IMAGE_NAME)

deploy: push
	kubectl apply -f deploy/crds/sunsetapi_v1_sunsetapi_crd.yaml
	kubectl apply -f deploy/crds/sunsetapi_v1_sunsetapi_cr.yaml
	kubectl apply -f rbac/sunsetapi_operator_service_account.yaml
	kubectl apply -f deploy/operator.yaml

deploy-all:
	kubectl apply -f deploy/crds/sunsetapi_v1_sunsetapi_crd.yaml
	kubectl apply -f deploy/crds/sunsetapi_v1_sunsetapi_cr.yaml
	kubectl apply -f rbac/sunsetapi_operator_service_account.yaml
	kubectl apply -f deploy/operator.yaml

show:
	- kubectl get crds | grep sunsetapi
	- kubectl get sunsetapis -n $(NAMESPACE)
	- kubectl get pods

logs:
	oc logs -f -l name=sunsetapi-operator

remove-all:
	- kubectl delete -f deploy/operator.yaml
	- kubectl delete -f rbac/sunsetapi_operator_service_account.yaml
	- kubectl delete -f deploy/crds/sunsetapi_v1_sunsetapi_cr.yaml
	- kubectl delete -f deploy/crds/sunsetapi_v1_sunsetapi_crd.yaml

.PHONY: build push deploy deploy-all show remove-all
