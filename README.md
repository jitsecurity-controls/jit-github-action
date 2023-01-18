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
    description: 'password for docker registry'
    required: true
  container_args:
    description: 'container additional args'
    required: false
    default: ""  
  security_control:
    description: "Docker image tag path of security control to execute"
    required: true
  security_control_args:
    description: "argument to pass to the security control"
    required: false
  security_control_output_file:
    description: "path to the security control output"
    required: false
    default: ""
  dispatch_type:
    description: "'workflow' or 'repository' (dispatch_type is deprecated and will be removed once all clients <controls> stop sending it)"
    required: false
    default: "workflow"
```
