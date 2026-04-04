# Architecture
### Creating and Managing Kubernetes Cluster with Kind

![img.png](img.png)

![img_1.png](img_1.png)

Step-1 
first launch EC2 instance on AWS
then 
SHH to local
then 
run command
```cookie
sudo apt-get update
```
then install docker on your machine
```cookie
sudo apt-get install docker.io
```
```cookie
docker ps
```
```cookie
sudo usermod -aG docker &USER && newgrp docker
```
then again check like docker ps is working or not


```
ubuntu@ip-172-31-46-109:~$ sudo docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
ubuntu@ip-172-31-46-109:~$ docker ps
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.50/containers/json": dial unix /var/run/docker.sock: connect: permission denied
ubuntu@ip-172-31-46-109:~$  sudo usermod -aG docker $USER && newgrp docker
```
STEP-2
```cookie
git clone https://github.com/LondheShubham153/k8s-kind-voting-app.git
```
![img_2.png](img_2.png)

```cookie
ubuntu@ip-172-31-46-109:~/k8s-kind-voting-app/kind-cluster$ chmod +x install_kind.sh
```
```cookie
ubuntu@ip-172-31-46-109:~/k8s-kind-voting-app/kind-cluster$ ./install_kind.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    97  100    97    0     0    351      0 --:--:-- --:--:-- --:--:--   351
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 6304k  100 6304k    0     0  6950k      0 --:--:-- --:--:-- --:--:--  267M
ubuntu@ip-172-31-46-109:~/k8s-kind-voting-app/kind-cluster$
```
```cookie
ubuntu@ip-172-31-46-109:~/k8s-kind-voting-app/kind-cluster$ kind create cluster --config=config.yml --name=my-cluster
```
After that
```cookie
ubuntu@ip-172-31-46-109:~/k8s-kind-voting-app/kind-cluster$ chmod +x install_kubectl.sh
```
```cookie
ubuntu@ip-172-31-46-109:~/k8s-kind-voting-app/kind-cluster$ ./install_kubectl.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 49.0M  100 49.0M    0     0  26.8M      0  0:00:01  0:00:01 --:--:-- 26.8M
Client Version: v1.30.0
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
kubectl installation complete.
```

```cookie
ubuntu@ip-172-31-41-107:~/k8s-kind-voting-app/kind-cluster$ chmod +x install_kubectl.sh
ubuntu@ip-172-31-41-107:~/k8s-kind-voting-app/kind-cluster$ ll
total 32
drwxrwxr-x  2 ubuntu docker 4096 Apr  3 16:55 ./
drwxrwxr-x 12 ubuntu docker 4096 Apr  3 16:54 ../
-rw-rw-r--  1 ubuntu docker 4422 Apr  3 16:54 commands.md
-rw-rw-r--  1 ubuntu docker  199 Apr  3 16:54 config.yml
-rw-rw-r--  1 ubuntu docker  373 Apr  3 16:54 dashboard-adminuser.yml
-rwxrwxr-x  1 ubuntu docker  195 Apr  3 16:54 install_kind.sh*
-rwxrwxr-x  1 ubuntu docker  324 Apr  3 16:54 install_kubectl.sh*
ubuntu@ip-172-31-41-107:~/k8s-kind-voting-app/kind-cluster$ ./install_kubectl.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 49.0M  100 49.0M    0     0  99.7M      0 --:--:-- --:--:-- --:--:-- 99.9M
Client Version: v1.30.0
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
kubectl installation complete.
ubuntu@ip-172-31-41-107:~/k8s-kind-voting-app/kind-cluster$ kubectl get nodes
NAME                       STATUS   ROLES           AGE     VERSION
my-cluster-control-plane   Ready    control-plane   2m27s   v1.30.0
my-cluster-worker          Ready    <none>          2m5s    v1.30.0
my-cluster-worker2         Ready    <none>          2m6s    v1.30.0
ubuntu@ip-172-31-41-107:~/k8s-kind-voting-app/kind-cluster$
```
```cookie
ubuntu@ip-172-31-41-107:~/k8s-kind-voting-app/k8s-specifications$ kubectl apply -f .
deployment.apps/db created
service/db created
deployment.apps/redis created
service/redis created
deployment.apps/result created
service/result created
deployment.apps/vote created
service/vote created
deployment.apps/worker created
```
```cookie
kubectl get all
```
![img_3.png](img_3.png)
install heml
```cookie
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
```

![img_4.png](img_4.png)
```
chmod +x get_helm.sh
```
```
./get_helm.sh
```
![img_5.png](img_5.png)
Install Kube Prometheus Stack
```cookie
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo update
kubectl create namespace monitoring
helm install kind-prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --set prometheus.service.nodePort=30000 --set prometheus.service.type=NodePort --set grafana.service.nodePort=31000 --set grafana.service.type=NodePort --set alertmanager.service.nodePort=32000 --set alertmanager.service.type=NodePort --set prometheus-node-exporter.service.nodePort=32001 --set prometheus-node-exporter.service.type=NodePort
kubectl get svc -n monitoring
kubectl get namespace
```
```cookie
ubuntu@ip-172-31-41-107:~$ helm repo list
NAME                    URL
prometheus-community    https://prometheus-community.github.io/helm-charts
ubuntu@ip-172-31-41-107:~$
```

```cookie
helm repo add stable https://charts.helm.sh/stable
```
```cookie
ubuntu@ip-172-31-41-107:~$ helm repo list
NAME                    URL
prometheus-community    https://prometheus-community.github.io/helm-charts
stable                  https://charts.helm.sh/stable
ubuntu@ip-172-31-41-107:~$
```
```cookie
helm repo update
```
```cookie
 kubectl create namespace monitoring
```
```cookie
helm install kind-prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --set prometheus.service.nodePort=30000 --set prometheus.service.type=NodePort --set grafana.service.nodePort=31000 --set grafana.service.type=NodePort --set alertmanager.service.nodePort=32000 --set alertmanager.service.type=NodePort --set prometheus-node-exporter.service.nodePort=32001 --set prometheus-node-exporter.service.type=NodePort
```
```cookie
 kubectl create namespace monitoring
```
```cookie
ubuntu@ip-172-31-41-107:~$ kubectl get pods -n monitoring
NAME                                                  READY   STATUS             RESTARTS   AGE
kind-prometheus-grafana-6fc8b97d89-mmh7p              0/3     ImagePullBackOff   0          113s
kind-prometheus-kube-prome-operator-5ddcd78ff-2srrx   0/1     ErrImagePull       0          113s
kind-prometheus-kube-state-metrics-798df5b5f7-xrqvj   0/1     ImagePullBackOff   0          113s
kind-prometheus-prometheus-node-exporter-6dll9        1/1     Running            0          113s
kind-prometheus-prometheus-node-exporter-x88kn        1/1     Running            0          113s
kind-prometheus-prometheus-node-exporter-xjnkv        1/1     Running            0          113s
ubuntu@ip-172-31-41-107:~$
```
```cookie
ubuntu@ip-172-31-41-107:~$ kubectl get svc -n monitoring
NAME                                       TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                         AGE
kind-prometheus-grafana                    NodePort    10.96.162.38    <none>        80:31000/TCP                    12m
kind-prometheus-kube-prome-alertmanager    NodePort    10.96.123.206   <none>        9093:32000/TCP,8080:32722/TCP   12m
kind-prometheus-kube-prome-operator        ClusterIP   10.96.127.222   <none>        443/TCP                         12m
kind-prometheus-kube-prome-prometheus      NodePort    10.96.250.79    <none>        9090:30000/TCP,8080:30431/TCP   12m
kind-prometheus-kube-state-metrics         ClusterIP   10.96.62.237    <none>        8080/TCP                        12m
kind-prometheus-prometheus-node-exporter   NodePort    10.96.75.74     <none>        9100:32001/TCP                  12m
ubuntu@ip-172-31-41-107:~$

```
```cookie
kubectl port-forward svc/kind-prometheus-kube-prome-prometheus -n monitoring 9090:9090 --address=0.0.0.0 &
```
![img_7.png](img_7.png)
![img_6.png](img_6.png)
![img_8.png](img_8.png)

URL:
http://52.66.181.122:9090/metrics
![img_9.png](img_9.png)

# (Prometheus Queries)
```cookie
sum (rate (container_cpu_usage_seconds_total{namespace="default"}[1m])) / sum (machine_cpu_cores) * 100

sum (container_memory_usage_bytes{namespace="default"}) by (pod)


sum(rate(container_network_receive_bytes_total{namespace="default"}[5m])) by (pod)
sum(rate(container_network_transmit_bytes_total{namespace="default"}[5m])) by (pod)


```
![img_10.png](img_10.png)
![img_11.png](img_11.png)
![img_12.png](img_12.png)
![img_13.png](img_13.png)
![img_14.png](img_14.png)

```cookie
 kubectl port-forward svc/vote 5000:5000 --address=0.0.0.0 &
```
add port on security group
```cookie
http://52.66.181.122:5000/
```
![img_15.png](img_15.png)

Now we will setup grafana
![img_16.png](img_16.png)
```cookie
kubectl port-forward svc/kind-prometheus-grafana -n monitoring 3000:80 --address=0.0.0.0 &
```
```cookie
http://52.66.181.122:9090/
```
![img_17.png](img_17.png)

Email: admin
password: admin
if you id password not work
please use this command

```cookie
kubectl exec -it <grafana-pod> -n <namespace> -- grafana-cli admin reset-admin-password admin
```
or
```cookie
kubectl exec -it kind-prometheus-grafana-768b44748c-hdmq2 -n monitoring -- grafana-cli admin reset-admin-password admin
```

![img_18.png](img_18.png)

![img_19.png](img_19.png)
![img_20.png](img_20.png)
ye already add ho chuka hai

![img_21.png](img_21.png)
Now we will create dashboard
![img_22.png](img_22.png)
![img_23.png](img_23.png)
then select promotheus then
![img_24.png](img_24.png)
![img_25.png](img_25.png)

![img_26.png](img_26.png)
To set up the dashboard, I searched for a suitable Grafana dashboard on Google and copied its dashboard ID. Then, I navigated to my Grafana instance and used the import option to add the dashboard using that ID. After importing, I selected Prometheus as the data source. Once everything was configured, the dashboard loaded successfully and started displaying the metrics as expected.


final code
```cookie
ubuntu@ip-172-31-41-118:~$ ll
total 56
drwxr-x---  7 ubuntu ubuntu  4096 Apr  4 06:35 ./
drwxr-xr-x  3 root   root    4096 Apr  4 05:37 ../
-rw-------  1 ubuntu docker  1710 Apr  4 06:35 .bash_history
-rw-r--r--  1 ubuntu ubuntu   220 Mar 31  2024 .bash_logout
-rw-r--r--  1 ubuntu ubuntu  3771 Mar 31  2024 .bashrc
drwx------  3 ubuntu ubuntu  4096 Apr  4 05:54 .cache/
drwxrwxr-x  3 ubuntu docker  4096 Apr  4 05:54 .config/
drwxr-xr-x  3 ubuntu docker  4096 Apr  4 05:48 .kube/
-rw-r--r--  1 ubuntu ubuntu   807 Mar 31  2024 .profile
drwx------  2 ubuntu ubuntu  4096 Apr  4 05:37 .ssh/
-rw-r--r--  1 ubuntu ubuntu     0 Apr  4 05:40 .sudo_as_admin_successful
-rwxrwxr-x  1 ubuntu docker 11929 Apr  4 05:50 get_helm.sh*
drwxrwxr-x 12 ubuntu docker  4096 Apr  4 05:42 k8s-kind-voting-app/
ubuntu@ip-172-31-41-118:~$
```
