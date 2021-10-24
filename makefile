

.PHONY: default-namespace
default-namespace:
	kubectl config set-context --current --namespace=nginx

.PHONY: echo
echo:
	echo hello

.PHONY: install-sealedsecrets-controller
install-sealedsecrets-controller:
	kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/controller.yaml

.PHONY: deploy-nginx
deploy-nginx:
	kubectl apply -k nginx/overlays/local/

.PHONY: deploy-jenkins
deploy-jenkins:
	kubectl apply -k jenkins/overlays/local/

.PHONY: deploy-gitea
deploy-gitea:
	kubectl apply -k gitea/overlays/local/
