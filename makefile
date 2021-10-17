

.PHONY: default-namespace
default-namespace:
	kubectl config set-context --current --namespace=nginx

.PHONY: echo
echo:
	echo hello

.PHONY: install-sealedsecrets-controller
install-sealedsecrets-controller:
	kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/controller.yaml

.PHONY: deploy-nginx-local
deploy-nginx-local:
	kubectl apply -k nginx/overlays/local/	
