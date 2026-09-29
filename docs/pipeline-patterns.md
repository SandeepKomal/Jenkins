# Jenkins Pipeline Patterns

These examples are generic. Replace credential IDs, registries, clusters and URLs with your own environment.

## Declarative Pipeline

```groovy
pipeline {
  agent any
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Build') { steps { sh './mvnw -B package' } }
    stage('Test') { steps { sh './mvnw -B test' } }
  }
  post {
    always {
      archiveArtifacts artifacts: 'target/*.jar', allowEmptyArchive: true
    }
  }
}
```

## Immutable image tags

Prefer `build-142` or a Git SHA over `latest`. Immutable tags make rollback and incident investigation easier.

## Quality gates

```text
compile → unit tests → static analysis → dependency scan
        → package → image build → image scan → publish
```

Do not hide failing tests with `-DskipTests=true` unless there is a documented reason.

## Deployment verification

```bash
kubectl rollout status deployment/myapp --timeout=180s
kubectl get pods -l app=myapp
```

An accepted Kubernetes API request does not mean the application is healthy.

## Parameters and approval

Use parameters for environment-specific values and add explicit approval before sensitive production changes.

```groovy
parameters {
  choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'])
}
```

## Workspace hygiene

```groovy
post {
  always { deleteDir() }
}
```

## Secret handling

Use Jenkins Credentials rather than literals. Never echo secret variables or place them in Git.
