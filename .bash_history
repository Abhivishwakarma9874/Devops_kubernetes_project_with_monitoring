df -h
sudo apt-get update
sudo apt-get install docker.io
docker ps
sudo usermod -aG docker &USER && newgrp docker
sudo usermod -aG docker $USER && newgrp docker
docker ps
git clone https://github.com/LondheShubham153/k8s-kind-voting-app.git
ll
cd k8s-kind-voting-app/
ls
chmod +x install_kind.sh
cd k
cd kind-cluster/
ll
chmod +x install_kind.sh 
./install_kind.sh 
ll
kind create cluster --config=config.yml --name=my-cluster
ls
chmod +x install_kubectl.sh 
ll
./install_kubectl.sh 
ll
df -h
kubectl get pods
kubectl get nodes
kubectl apply -f .
cd ..
ll
cd k8s-specifications/
kubectl apply -f .
kubectl get all
cd 
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
ls
chmod +x get_helm.sh
ll
./get_helm.sh 
helm repo list
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo list
helm repo add stable https://charts.helm.sh/stable
helm repo update
kubectl create namespace monitoring
helm install kind-prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --set prometheus.service.nodePort=30000 --set prometheus.service.type=NodePort --set grafana.service.nodePort=31000 --set grafana.service.type=NodePort --set alertmanager.service.nodePort=32000 --set alertmanager.service.type=NodePort --set prometheus-node-exporter.service.nodePort=32001 --set prometheus-node-exporter.service.type=NodePort
df -h
kubectl get svc -n monitoring
kubectl get namespace
kubectl port-forward svc/kind-prometheus-kube-prome-prometheus -n monitoring 9090:9090 --address=0.0.0.0 &
kubectl get svc
kubectl port-forward svc/vote 5000:5000 address=0.0.0.0 &
kubectl port-forward svc/vote 5000:5000 --address=0.0.0.0 &
