<img width="679" height="387" alt="image" src="https://github.com/user-attachments/assets/1c29f13a-bed5-4280-96f7-7cbf1c7a66f4" />

<img width="1359" height="734" alt="image" src="https://github.com/user-attachments/assets/530dcd11-e70d-4332-90a3-923b05ccd3ac" />
then connect our local

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin --update
```
```
aws --version
```
```
aws s3 ls
```
```
aws sts get-caller-identity
```
```
sudo apt-get update
```
### Install Docker
```
sudo apt-get update
sudo apt install docker.io
docker ps
sudo chown $USER /var/run/docker.sock
```
### Install kubectl

```
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client
```

### Install eksctl
```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl versio
```

```
kubectl version
```
```
eksctl version
```

```
eksctl create cluster \
  --name tws-cluster \
  --region ap-south-1 \
  --node-type t3.small \
  --nodes-min 2 \
  --nodes-max 3
```

<img width="1359" height="714" alt="image" src="https://github.com/user-attachments/assets/e2fccb89-86b0-4080-8c42-7c14d2ec4064" />

then
```
echo -n "admin" | base64
```

<img width="1358" height="683" alt="image" src="https://github.com/user-attachments/assets/374b24f0-c64a-4a48-b675-7116d303fcf8" />

```
kubectl get nodes
```

```
git clone https://github.com/LondheShubham153/two-tier-flask-app.git
```
```
ubuntu@ip-172-31-42-192:~/two-tier-flask-app/eks-manifests$ kubectl apply -f mysql-secrets.yml -f mysql-configmap.yml -f mysql-deployment.yml -f mysql-svc.yml
```
```
ubuntu@ip-172-31-42-192:~/two-tier-flask-app/eks-manifests$ kubectl apply -f two-tier-app-deployment.yml -f two-tier-app-svc.yml
```

<img width="1358" height="264" alt="image" src="https://github.com/user-attachments/assets/3e0b1cf3-5a3f-4740-bac0-17ba3ef1c994" />

<img width="1355" height="593" alt="image" src="https://github.com/user-attachments/assets/d591396d-4c8d-4a0b-a896-b9fbb50cea92" />


