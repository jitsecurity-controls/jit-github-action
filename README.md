# Jit Github Action

![alt text](images/jit-logo-small.png)

This repository is holding the Github Action that enables the Jit platform to run Jit Security Controls in your Github environment.

```yaml
inputs:
  pull_key:
    description: 'key for pulling the action repo'
    required: true
  docker_user:
    description: 'user for docker registry'
    required: true
  docker_password:
    registr: 'password for docker registry'
    required: true
  target_dir:
    description: 'Directory to scan'
    required: true
  security_control:
    description: "Docker image tag path of security control to execute"
    required: true
  security_control_args:
    description: "argument to pass to the security control"
    required: false
```
