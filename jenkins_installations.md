# Jenkins Installation and Agent Setup

This guide is a practical EC2 reference. For production, use supported Jenkins packages, least privilege and managed identity.

## 1. Prepare the controller

Install a supported Java runtime and Jenkins using the official package repository for your operating system.

```bash
sudo systemctl enable --now jenkins
sudo systemctl status jenkins
```

Restrict Jenkins access with network controls rather than exposing the administrative interface broadly.

## 2. Do not grant Jenkins root

Older notes in this repository used `NOPASSWD: ALL`. Do not copy that pattern into a production system. Use dedicated agents and grant only the permissions required by the pipeline.

## 3. Create an agent

Install the supported Java runtime and only the tools required by the workloads assigned to the agent:

```text
git
java
maven
docker
aws
kubectl
terraform
trivy
```

## 4. Connect the agent

Use a Jenkins-managed agent connection method such as SSH or inbound/WebSocket agents, depending on your environment. Store agent credentials in Jenkins Credentials; never commit private keys.

## 5. Agent labels

Give agents meaningful capability labels such as `linux`, `docker`, `kubernetes` or `terraform`.

```groovy
agent { label 'docker' }
```

## 6. AWS access

For EC2 agents, prefer an IAM instance profile with narrowly scoped permissions. Avoid storing long-lived AWS access keys in the agent filesystem. For external runners, use short-lived federation/OIDC where supported.

## 7. Docker access

Docker access can provide highly privileged host capabilities. Do not make `/var/run/docker.sock` world-writable. Isolate Docker-capable agents and use the least-privilege design appropriate to your environment.

## 8. Verify the agent

```bash
java -version
git --version
docker --version
aws --version
kubectl version --client
```

Only the tools required by your pipeline need to be installed.

## 9. Next steps

- [Architecture](docs/architecture.md)
- [Pipeline patterns](docs/pipeline-patterns.md)
- [Security](docs/security.md)
- [Troubleshooting](docs/troubleshooting.md)

> Existing screenshots and historical notes remain in the repository, but credentials and privileged configuration should never be copied into source control.
