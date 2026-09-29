# Security Policy

This repository contains Jenkins learning material and examples. It is not a production Jenkins distribution.

Do not publish credentials, tokens, private keys or exploitable private infrastructure details in public issues.

If a secret is discovered:

1. Do not reuse it.
2. Treat it as compromised.
3. Rotate or revoke it immediately.
4. Remove it from repository history using an appropriate secret-removal process.
5. Review access logs where applicable.

Keep secrets in Jenkins Credentials or an approved secret manager.
