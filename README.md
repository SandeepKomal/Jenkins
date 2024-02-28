# ==== Install Jenkins Server on EC2 Machine(Master Node) ====

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
### Assign Root Privileges to Jenkins User

```
sudo vi /etc/sudoers  
```
```
jenkins ALL=(ALL) NOPASSWD: ALL
```

### Restart Jenkins server and enable it
```
sudo service jenkins restart
```
```
sudo systemctl enable jenkins
```
# ==== Create new Ec2 Instance and configure Slave Node ====

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

### setup jenkins slave
```
sudo su
```
```
sudo useradd jenkins-slave1
```
```
passwd jenkins-slave1 # set password for user jenkins-slave1
```
```
sudo vi /etc/sudoers
```
```
jenkins-slave1 ALL=(ALL) NOPASSWD: ALL
```
```
sudo su - jenkins-slave1
```
```
ssh-keygen -t ed25519  or ssh-keygen
```
```
cd .ssh
```
```
cat id_ed25519.pub > authorized_keys
```
```
chmod 700 authorized_keys
```


