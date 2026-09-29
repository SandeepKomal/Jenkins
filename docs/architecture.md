# Jenkins Architecture

Jenkins separates orchestration from workload execution.

```text
Git / Webhook
     |
     v
+-----------------------+
| Jenkins Controller    |
| queue • jobs • creds  |
| pipeline orchestration|
+-----------+-----------+
            |
      +-----+-----+------+
      v           v      v
   Agent A     Agent B  Agent C
   Linux       Docker   Kubernetes
      \           |       /
       +----------+------+
                  |
                  v
             Build / Test / Deploy
```

## Controller

The controller schedules builds, manages queues, stores configuration and coordinates agents. Avoid using it as a general-purpose build server when dedicated agents are available.

## Agents

Agents execute Maven, Gradle, Docker, security scans, Terraform and kubectl workloads. Use labels to route jobs to suitable agents.

```groovy
agent { label 'docker' }
```

## Credentials

Never put credentials directly in a Jenkinsfile.

```groovy
withCredentials([string(credentialsId: 'example-token', variable: 'TOKEN')]) {
  sh 'my-command'
}
```

For AWS, prefer short-lived identity such as an IAM role where supported.

## Security baseline

- Keep Jenkins and plugins current.
- Restrict anonymous access.
- Use appropriate authorization controls.
- Disable unnecessary plugins and agent protocols.
- Back up controller configuration.
- Audit credential usage.
- Treat build agents as privileged infrastructure.

New documentation uses **controller/agent** terminology. Older filenames are retained to avoid breaking links.
