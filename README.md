# Jenkins — CI/CD Engineering Lab

A practical Jenkins learning hub for CI/CD, DevSecOps, containers, AWS, Kubernetes and Infrastructure as Code.

![Jenkins](https://img.shields.io/badge/Jenkins-CI%2FCD-D24939?logo=jenkins&logoColor=white) ![Pipeline as Code](https://img.shields.io/badge/Pipeline-as%20Code-0A66C2) ![DevSecOps](https://img.shields.io/badge/DevSecOps-Enabled-2E8B57)

## Learn

| Area | Topics |
|---|---|
| Fundamentals | controller, agents, executors, tools, credentials |
| Pipelines | Declarative, Scripted, parameters, gates, artifacts |
| CI | checkout, build, test, package |
| DevSecOps | SAST, SCA, container scanning, secret hygiene |
| Cloud | AWS ECR, ECS/EKS patterns |
| Kubernetes | rollout, health checks, rollback, RBAC |
| IaC | Terraform plan/apply approval patterns |
| Operations | logs, artifacts, cleanup, troubleshooting |
| Administration | JCasC, agents, plugin and security concepts |

## Learning path

1. [Install Jenkins](jenkins_installations.md)
2. Read [architecture](docs/architecture.md)
3. Run [Declarative Pipeline](examples/declarative/Jenkinsfile)
4. Study [pipeline patterns](docs/pipeline-patterns.md)
5. Apply [security guidance](docs/security.md)
6. Explore AWS/ECR/Kubernetes examples under `Jenkins/JenkinsFile/`
7. Use the [troubleshooting playbook](docs/troubleshooting.md)

## Pipeline lifecycle

```text
Git → Checkout → Validate → Build → Test
                         ↓
                Quality / Security Gates
                         ↓
                 Package / Container
                         ↓
                 Registry / Artifact
                         ↓
                      Deploy
                         ↓
                Health Check / Rollout
                    ↙          ↘
                Success      Rollback
```

## Security rule

Never commit AWS keys, passwords, tokens, private keys, kubeconfigs, SonarQube tokens or production credentials. Use Jenkins Credentials, IAM roles/short-lived identity and least-privilege Kubernetes service accounts.

## Structure

```text
Jenkins/
├── Jenkins/                  # Existing Jenkins notes and real-world examples
├── docs/                     # Architecture, security, patterns, troubleshooting
├── examples/                 # Clean reusable Jenkinsfile labs
├── jenkins/casc/             # Jenkins Configuration as Code starter
├── jenkins/docker/           # Optional controller image
├── scripts/                  # Validation helpers
└── .github/                  # Repository validation
```

⭐ If this repository helps you learn Jenkins, consider starring it and contributing a practical improvement.
