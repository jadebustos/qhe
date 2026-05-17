# README

These examples use [Podman](https://podman.io/), but if you prefer to use Docker you will only need to replace **podman** by **docker** on the commands.

You can also use [Podman Desktop](https://podman-desktop.io/) to easyly run containers from your favorite Operating System using a Graphical User Interface.

You have different options to try this notebook:

* You can create the container by yourself.
* You can get the container from my container repository:

  ```console
  $ podman pull quay.io/rhte_2019/qhe:latest
  ```

  and after that running it.

## Creating the container

We will build the container in two phases:

From this directory create the container to run quantum computing code:

```console
$ podman build -t qhe:1.0 -f Containerfile . 
...
$ podman images
REPOSITORY                 TAG         IMAGE ID      CREATED       SIZE
localhost/qhe              1.0         b2955f6be9c3  13 seconds ago      841 MB
<none>                     <none>      5029d1ec36b4  About a minute ago  1.26 GB
docker.io/library/ubuntu   24.04       0b1ebe5dd426  4 weeks ago         80.7 MB
$
```

## Running the container

Go to the directory where you have the jupyter notebooks you want to run:

```console
$ podman run -p 8888:8888 -v $(pwd):/workspace:Z localhost/qhe:1.0
```

If you are not using SELinux you can skip **:Z**. Ensure write privileges for all users in the notebooks directory due to Jupyterlab will be executing as a non-root user.

If you downloaded it from my container repository:

```console
$ podman run --rm -d --name qhe -p 8888:8888 quay.io/rhte_2019/qhe:latest
```

Now you can use your favorite browser to browse https://localhost:8888

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
    "hashed_password": "argon2:19$..."
  }
}
```

After having created the password modify the file according to:

```json
{
  "ServerApp": {
    "ip": "0.0.0.0",
    "port": 8888,
    "open_browser": false,
    "root_dir": "/workspace"
  },
  "IdentityProvider": {
    "hashed_password": "argon2:$argon2id$v=19$..."
  }
}
```

You can add this file via a secret volume to your container:

```console
$ podman run -v jupyter_server_config.json:/etc/jupyter/jupyter_server_config.json:ro -v $(pwd):/workspace:Z -p 8888:8888 localhost/qhe:1.0
...
$
```

