# /bin/sh

prometheus_version="25.20.1"
grafana_version="7.3.9"
namespace="monitoring"
prometheus_release_name=prometheus
grafana_release_name=grafana

echo "Installation of monitoring stack"

echo "Add required repositories and update"

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

echo "Install Prometheus version $prometheus_version in namespace $namespace"

helm upgrade $prometheus_release_name prometheus-community/prometheus -f ./prometheus/values.yaml --install --namespace $namespace --version $prometheus_version

echo "Install Grafana version $grafana_version in namespace $namespace"

helm upgrade $grafana_release_name grafana/grafana -f ./grafana/values.yaml --install --namespace $namespace --version $grafana_version

echo "Installation complete"