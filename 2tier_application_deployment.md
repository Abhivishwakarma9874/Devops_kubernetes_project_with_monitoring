<img width="679" height="387" alt="image" src="https://github.com/user-attachments/assets/1c29f13a-bed5-4280-96f7-7cbf1c7a66f4" />

<img width="1359" height="734" alt="image" src="https://github.com/user-attachments/assets/530dcd11-e70d-4332-90a3-923b05ccd3ac" />

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin --update
```

<img width="1359" height="714" alt="image" src="https://github.com/user-attachments/assets/e2fccb89-86b0-4080-8c42-7c14d2ec4064" />

then


```
eksctl create cluster \
  --name tws-cluster \
  --region ap-south-1 \
  --node-type t3.small \
  --nodes-min 2 \
  --nodes-max 3
```
```
echo -n "admin" | base64
```

<img width="1358" height="683" alt="image" src="https://github.com/user-attachments/assets/374b24f0-c64a-4a48-b675-7116d303fcf8" />
