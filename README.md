# Jit Github Action

![alt text](images/jit-logo-small.png)

This repository is holding the Github Action that enables the Jit platform to run Jit Security Controls in your Github environment.

```yaml
inputs:
  target_dir:
    description: 'Dir to scan'
    required: true
  security_control:
    description: "Docker image tag path of security control to execute"
    required: true
  security_control_args:
    description: "argument to pass to the security control"
    required: false
```