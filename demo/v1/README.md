# Installation de la stack de monitoring

## Ajout des repos

`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`

`helm repo add grafana https://grafana.github.io/helm-charts`

`helm repo update`

## Installation

`helm install prometheus prometheus-community/prometheus --set alertmanager.enabled=false --namespace monitoring --version 25.20.1`

`helm install grafana grafana/grafana --set persistence.enabled=true --set adminPassword=strongpassword --namespace monitoring --version 7.3.9`

