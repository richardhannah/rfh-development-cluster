

.PHONY: default-namespace
default-namespace:
	kubectl config set-context --current --namespace=jenkins

.PHONY: echo
echo:
	echo hello

.PHONY: install-sealedsecrets-controller
install-sealedsecrets-controller:
	kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/controller.yaml

.PHONY: install-nginx-ingresscontroller
install-nginx-ingresscontroller:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.4/deploy/static/provider/cloud/deploy.yaml

.PHONY: deploy-nginx
deploy-nginx:
	kubectl apply -k nginx/overlays/local/

.PHONY: deploy-jenkins
deploy-jenkins:
	kubectl apply -k jenkins/overlays/local/

.PHONY: deploy-gitea
deploy-gitea:
	kubectl apply -k gitea/overlays/local/
