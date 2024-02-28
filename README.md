# Install Jenkins Server on EC2 Machine(Master Node)

### Update Linux Packages

```
sudo yum -y update
```
###  Install Java 11 OR 17
```
sudo amazon-linux-extras install java-openjdk11 -y
```
```
sudo yum install java-17-amazon-corretto-headless -y
```

###   Install Jenkins Server 
```
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
```
```
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
```
```
sudo yum install jenkins -y
```
```
sudo systemctl start jenkins
```
```
systemctl status jenkins
```
### Install  Kustomize CLI tool on EC2:

```
curl --silent --location --remote-name \
  "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v3.2.3/kustomize_kustomize.v3.2.3_linux_amd64" && \
  chmod a+x kustomize_kustomize.v3.2.3_linux_amd64 && \
  sudo mv kustomize_kustomize.v3.2.3_linux_amd64 /usr/local/bin/kustomize
```
```
kustomize version
```
### Assign Root Privileges to Jenkins User

```
sudo vi /etc/sudoers  
```
```
jenkins ALL=(ALL) NOPASSWD: ALL
```

### Install  eksctl CLI tool on EC2 :

for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`

```
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
```
```
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
```
(Optional) Verify checksum
```
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check
```
```
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
```
```
sudo mv /tmp/eksctl /usr/local/bin
```

