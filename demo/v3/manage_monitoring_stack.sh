# /bin/sh

prometheus_version="25.20.1"
grafana_version="7.3.9"
namespace="monitoring"
prometheus_release_name=prometheus
grafana_release_name=grafana
prometheus_repo_name=prometheus-community
grafana_repo_name=grafana

add_update_repo(){
    echo "Add required repositories and update"

    helm repo add $prometheus_repo_name https://prometheus-community.github.io/helm-charts
    helm repo add $grafana_repo_name https://grafana.github.io/helm-charts
    helm repo update
}

uninstall_release(){
    echo "Uninstall release $1"

    helm uninstall $1

    echo "Release $1 uninstalled"
}

upgrade_release(){
    echo "Upgrading release $1 with version $2"

    helm upgrade $1 $3/$1 -f ./$1/values.yaml --create-namespace --namespace $namespace --version $2

    echo "Release $1 upgraded"
}

install_release(){
    echo "Installing release $1 with version $2"

    helm install $1 $3/$1 -f ./$1/values.yaml --create-namespace --namespace $namespace --version $2

    echo "Release $1 installed"
}

while true; do
    printf 'What do you want to do (1 - Install, 2 - Upgrade release, 3 - Upgrade release only values, 4 - Uninstall release, 5 -Quit)? '
    read action

    if [ "$action" != "${action#[1]}" ]
    then 
        add_update_repo
        printf 'Which component (1 - Prometheus, 2 - Grafana)? '
        read component
        if [ "$component" != "${component#[1]}" ]
        then 
           install_release $prometheus_release_name $prometheus_version $prometheus_repo_name
        else
           install_release $grafana_release_name $grafana_version $grafana_repo_name     
        fi
    elif  [ "$action" != "${action#[2]}" ]
    then 
        add_update_repo
        printf 'Which component (1 - Prometheus, 2 - Grafana)? '
        read component
        if [ "$component" != "${component#[1]}" ]
        then 
           upgrade_release $prometheus_release_name $prometheus_version $prometheus_repo_name
        else
           upgrade_release $grafana_release_name $grafana_version $grafana_repo_name     
        fi
    elif  [ "$action" != "${action#[3]}" ]
    then
        add_update_repo
        printf 'Which component (1 - Prometheus, 2 - Grafana)? '
        read component
        if [ "$component" != "${component#[1]}" ]
        then 
           upgrade_release $prometheus_release_name $prometheus_version $prometheus_repo_name
        else
           upgrade_release $grafana_release_name $grafana_version $grafana_repo_name       
        fi
    elif  [ "$action" != "${action#[4]}" ]
    then
        printf 'Which component (1 - Prometheus, 2 - Grafana)? '
        read component
        if [ "$component" != "${component#[1]}" ]
        then 
           uninstall_release $prometheus_release_name
        else
           uninstall_release $grafana_release_name      
        fi   
    else
        echo "Goodby"
        exit 0;
    fi    
done


