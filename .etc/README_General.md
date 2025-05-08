# General + Tips and Tricks

## Zig

[Click here for ZVM](https://github.com/tristanisham/zvm).

```zsh
curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash

# specific version
zvm i --zls 0.13.0
zvm use 0.13.0

# master version
zvm i --zls master
zvm use master

# checks
zvm ls
zig version
```

## Git

### Multiple different Github accounts / SSH keys

Could be used to keep two different Github accounts and two corresponding different SSH keys on the same machine.
For example, work + personal Github accounts.

[Click here](https://gist.github.com/oanhnn/80a89405ab9023894df7).

### `fatal: Could not read from remote repository.`

```
$ git fetch --all

ssh_dispatch_run_fatal: Connection to 140.82.121.3 port 22: Operation timed out
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

[Click here](https://gist.github.com/Tamal/1cc77f88ef3e900aeae65f0e5e504794).

## Kubernetes

### `kubectl port-forward` + socat pod

Source: [click here](https://stackoverflow.com/a/70763298/571465).

Kubernetes pod configuration:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: [YOUR_NAME]-pgsql-socat
  labels:
    name: [YOUR_NAME]-pgsql-socatt
spec:
  containers:
  - name: [YOUR_NAME]-pgsql-socat
    image: alpine/socat
    command: ["socat", "-dd", "tcp4-listen:9901,fork,reuseaddr", "tcp4:[RDS_DB_HOSTNAME]:5432"]
    resources:
      limits:
        memory: "64Mi"
        cpu: "50m"
    ports:
      - containerPort: 9901
```

Run locally on your machine:

```zsh
k apply -f [YOUR_NAME]-pgsql-socat.yaml
k get pods --all-namespaces | grep [YOUR_NAME]
k port-forward [YOUR_NAME]-pgsql-socat 9901:9901
k delete pod [YOUR_NAME]-pgsql-socat
```

## Docker

Alternatives to Docker Desktop:

- https://github.com/abiosoft/colima
- https://docs.orbstack.dev/install
- https://rancherdesktop.io/
