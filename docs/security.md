# Jenkins Security and DevSecOps

Jenkins is part of the software supply chain. Protect the controller and every agent capable of executing pipeline code.

| Layer | Control |
|---|---|
| Source | branch protection and reviewed changes |
| Jenkins | authentication and authorization |
| Credentials | Jenkins Credentials / short-lived identity |
| Dependencies | SCA |
| Code | SAST / quality analysis |
| Container | image scanning |
| Infrastructure | Terraform validation and plan review |
| Kubernetes | RBAC and namespace isolation |
| Runtime | least-privilege service accounts |
| Audit | build logs and retained reports |

## Never commit

AWS access keys, cloud secrets, Jenkins secret text, SSH private keys, administrator kubeconfigs, SonarQube tokens, registry passwords or production credentials.

## AWS

For an EC2 agent, prefer an IAM instance profile with only the permissions required by the pipeline. Avoid `aws configure` credentials in the workspace.

For external runners, use short-lived federation/OIDC where supported.

## Container scanning

```text
Build → Scan → Enforce policy → Push approved image
```

Example:

```bash
trivy image --severity HIGH,CRITICAL --exit-code 1 "$IMAGE"
```

Choose thresholds according to your organization's risk policy.

## Kubernetes

Give Jenkins only the permissions required for the deployment. Avoid cluster-admin for routine application delivery.

## Review checklist

- [ ] No secrets in source
- [ ] No hard-coded production endpoints
- [ ] Immutable image tag
- [ ] Tests before deployment
- [ ] Security checks visible
- [ ] Deployment health verification
- [ ] Rollback path documented
- [ ] Least-privilege agent identity
