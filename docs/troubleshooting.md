# Jenkins Troubleshooting Playbook

## Build stuck in queue

Check executor availability, requested labels, agent status and whether the agent accepts tasks.

## Agent offline

Check Java compatibility, network connectivity, agent process, disk space and required tools.

## Docker permission denied

Do not make the Docker socket world-writable. Docker socket access is highly privileged; use a dedicated agent with controlled access.

## kubectl authentication fails

```bash
kubectl config current-context
kubectl cluster-info
kubectl auth can-i get pods
```

Review the Jenkins credential and Kubernetes authorization instead of copying an administrator kubeconfig into Git.

## Maven fails

```bash
java -version
mvn -version
git --version
```

Verify configured JDK/Maven versions and agent tools.

## Deployment applied but app is unhealthy

```bash
kubectl get pods
kubectl describe deployment myapp
kubectl describe pod <pod>
kubectl logs <pod> --tail=200
kubectl rollout status deployment/myapp
```

## Slow builds

Look for oversized Docker contexts, repeated dependency downloads, serial stages, undersized agents and excessive artifact retention.

Capture the build number, failed stage, console log, agent, commit SHA, tool versions and deployment state before retrying.
