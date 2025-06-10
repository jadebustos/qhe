# README

## Creating the container

In the directory where the _Containerfile_ is:

```console
$ podman build -t qhe:v1.0 .
...
$ podman images
REPOSITORY                               TAG                   IMAGE ID      CREATED       SIZE
localhost/notebook                       v1                    414943d5a01a  4 days ago    6.48 GB
...
$
```

## Running the container

```console
$ podman run --rm -d --name qhe -p 8888:8888 localhost/qhe:v1.0
```

## Custom configuration 

You can create your custom configuration file **jupyter_server_config.json**:

```json
{
  "IdentityProvider": {
    "hashed_password": "argon2:..."
  }
}
```

Where the hashed password can be created:

```console
$ JUPYTER_CONFIG_DIR=$PWD jupyter server password
Enter password:
Verify password:
[JupyterPasswordApp] Wrote hashed password to ./jupyter_server_config.json
$ cat jupyter_server_config.json
{
  "IdentityProvider": {
    "hashed_password": "argon2:..."
  }
}
```

You can add this file via a secret volume to your container, mounting it in _/home/notebook/.jupyter/jupyter_server_config.json_
